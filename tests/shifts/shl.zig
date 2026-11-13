const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const shl = tern.shifts.shl;



test "moves trits up and drops overflow" {
    const original: Tryte = .{
        .p = 0b110000001,
        .n = 0b001100000,
    };
    const expected: Tryte = .{
        .p = 0b000000100,
        .n = 0b110000000,
    };

    try std.testing.expectEqual(expected, shl(original, 2));
}

test "by zero" {
    const original: Tryte = .{
        .p = 0b110000001,
        .n = 0b001100000,
    };

    try std.testing.expectEqual(original, shl(original, 0));
}

test "by full width clears everything" {
    const original: Tryte = .{
        .p = 0b110000001,
        .n = 0b001100000,
    };
    const all_zero: Tryte = .{
        .p = 0,
        .n = 0,
    };

    try std.testing.expectEqual(all_zero, shl(original, 9));
}
