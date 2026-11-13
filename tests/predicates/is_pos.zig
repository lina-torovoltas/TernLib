const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const isPos = tern.predicates.isPos;



test "isPos valid value and zero" {
    const valid: Tryte = .{
        .p = 0b000000101,
        .n = 0b000001010,
    };
    const zero: Tryte = .{
        .p = 0,
        .n = 0,
    };

    const expected_valid: Tryte = .{
        .p = 0b000000101,
        .n = 0b111111010,
    };
    const expected_zero: Tryte = .{
        .p = 0,
        .n = 0b111111111,
    };

    try std.testing.expectEqual(expected_valid, isPos(valid));
    try std.testing.expectEqual(expected_zero, isPos(zero));
}
