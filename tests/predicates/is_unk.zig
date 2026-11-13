const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const isUnk = tern.predicates.isUnk;



test "isUnk valid value and zero" {
    const valid: Tryte = .{
        .p = 0b000000101,
        .n = 0b000001010,
    };
    const zero: Tryte = .{
        .p = 0,
        .n = 0,
    };

    const expected_valid: Tryte = .{
        .p = 0b111110000,
        .n = 0b000001111,
    };
    const expected_zero: Tryte = .{
        .p = 0b111111111,
        .n = 0b000000000,
    };

    try std.testing.expectEqual(expected_valid, isUnk(valid));
    try std.testing.expectEqual(expected_zero, isUnk(zero));
}
