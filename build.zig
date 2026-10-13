const std = @import("std");



pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const io = b.graph.io;

    const ternlib_module = b.addModule("ternlib", .{
        .root_source_file = b.path("src/ternlib.zig"),
        .target = target,
        .optimize = optimize,
    });

    const test_step = b.step("test", "Run all unit tests");

    var tests_dir = try b.build_root.handle.openDir(io, "tests", .{ .iterate = true });
    defer tests_dir.close(io);

    var it = tests_dir.iterate();
    while (try it.next(io)) |entry| {
        if (entry.kind != .file) continue;
        if (!std.mem.endsWith(u8, entry.name, ".zig")) continue;

        const test_exe = b.addTest(.{
            .root_module = b.createModule(.{
                .root_source_file = b.path(b.fmt("tests/{s}", .{entry.name})),
                .target = target,
                .optimize = optimize,
            }),
        });
        test_exe.root_module.addImport("ternlib", ternlib_module);

        const run = b.addRunArtifact(test_exe);
        test_step.dependOn(&run.step);
    }
}
