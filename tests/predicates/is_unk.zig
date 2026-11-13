const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const isUnk = tern.predicates.isUnk;



test "all negative" {
    const all_neg: Tryte = .{
        .p = 0,
        .n = 0b111111111,
    };
    const expected: Tryte = .{
        .p = 0,
        .n = 0b111111111,
    };

    try std.testing.expectEqual(expected, isUnk(all_neg));
}

test "all zero" {
    const all_zero: Tryte = .{
        .p = 0,
        .n = 0,
    };
    const expected: Tryte = .{
        .p = 0b111111111,
        .n = 0,
    };

    try std.testing.expectEqual(expected, isUnk(all_zero));
}

test "all positive" {
    const all_pos: Tryte = .{
        .p = 0b111111111,
        .n = 0,
    };
    const expected: Tryte = .{
        .p = 0,
        .n = 0b111111111,
    };

    try std.testing.expectEqual(expected, isUnk(all_pos));
}
