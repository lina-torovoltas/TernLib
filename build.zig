const std = @import("std");



pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{
        .default_target = .{ .cpu_model = .native },
    });
    const optimize = b.standardOptimizeOption(.{
        .preferred_optimize_mode = .ReleaseFast,
    });


    const ternlib_mod = b.addModule("ternlib", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
        .strip = true,
        .omit_frame_pointer = true,
    });

    const lib = b.addLibrary(.{
        .name = "ternlib",
        .linkage = .static,
        .root_module = ternlib_mod,
    });
    
    b.installArtifact(lib);

    const tests = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("tests/test.zig"),
            .target = target,
            .optimize = .Debug,
            .imports = &.{.{ 
            	.name = "ternlib", 
                .module = ternlib_mod 
                },
            },
        }),
    });

    
    const run_tests = b.addRunArtifact(tests);
    
    const test_step = b.step("test", "just run tests");
    test_step.dependOn(&run_tests.step);
}
