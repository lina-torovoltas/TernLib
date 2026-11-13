const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const isNeg = tern.predicates.isNeg;



test "isNeg valid value and zero" {
    const valid: Tryte = .{
        .p = 0b000000101,
        .n = 0b000001010,
    };
    const zero: Tryte = .{
        .p = 0,
        .n = 0,
    };

    const expected_valid: Tryte = .{
        .p = 0b000001010,
        .n = 0b111110101,
    };
    const expected_zero: Tryte = .{
        .p = 0,
        .n = 0b111111111,
    };

    try std.testing.expectEqual(expected_valid, isNeg(valid));
    try std.testing.expectEqual(expected_zero, isNeg(zero));
}
