const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const rotl = tern.shifts.rotl;



test "wraps top trits to the bottom" {
    const original: Tryte = .{
        .p = 0b110000001,
        .n = 0b001100000,
    };
    const expected: Tryte = .{
        .p = 0b000000111,
        .n = 0b110000000,
    };

    try std.testing.expectEqual(expected, rotl(original, 2));
}

test "by full width returns original" {
    const original: Tryte = .{
        .p = 0b110000001,
        .n = 0b001100000,
    };

    try std.testing.expectEqual(original, rotl(original, 9));
}
