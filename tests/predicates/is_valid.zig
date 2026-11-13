const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const isValid = tern.predicates.isValid;



test "valid pattern" {
    const valid: Tryte = .{
        .p = 0b010101010,
        .n = 0b101010101,
    };
    const expected: Tryte = .{
        .p = 0b111111111,
        .n = 0b000000000,
    };

    try std.testing.expectEqual(expected, isValid(valid));
}

test "overlapping pattern" {
    const broken: Tryte = .{
        .p = 0b101010101,
        .n = 0b101010101,
    };
    const expected: Tryte = .{
        .p = 0b010101010,
        .n = 0b101010101,
    };

    try std.testing.expectEqual(expected, isValid(broken));
}


test "all overlapping" {
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

test "all zero" {
    const all_zero: Tryte = .{
        .p = 0,
        .n = 0,
    };
    const expected: Tryte = .{
        .p = 0b111111111,
        .n = 0b000000000,
    };

    try std.testing.expectEqual(expected, isValid(all_zero));
}
