const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const isValid = tern.predicates.isValid;



test "isValid valid value and zero" {
    const valid: Tryte = .{
        .p = 0b000000101,
        .n = 0b000001010,
    };
    const zero: Tryte = .{
        .p = 0,
        .n = 0,
    };
    const expected: Tryte = .{
        .p = 0b111111111,
        .n = 0b000000000,
    };

    try std.testing.expectEqual(expected, isValid(valid));
    try std.testing.expectEqual(expected, isValid(zero));
}


test "isValid overlapping trits" {
    const broken: Tryte = .{
        .p = 0b000100101,
        .n = 0b000010100,
    };
    const expected: Tryte = .{
        .p = 0b111111011,
        .n = 0b000000100,
    };

    try std.testing.expectEqual(expected, isValid(broken));
}


test "isValid all trits overlapping" {
    const broken: Tryte = .{
        .p = 0b111111111,
        .n = 0b111111111,
    };
    const expected: Tryte = .{
        .p = 0b000000000,
        .n = 0b111111111,
    };

    try std.testing.expectEqual(expected, isValid(broken));
}
