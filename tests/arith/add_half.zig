const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const addHalf = tern.arith.addHalf;



test "sum and carry" {
    const a: Tryte = .{
        .p = 0b000000111,
        .n = 0b111000000,
    };
    const b: Tryte = .{
        .p = 0b001001001,
        .n = 0b100100100,
    };

    const expected: @TypeOf(addHalf(a, b)) = .{
        .sum = .{
            .p = 0b100001010,
            .n = 0b010100001,
        },
        .carry = .{
            .p = 0b000000001,
            .n = 0b100000000,
        },
    };

    try std.testing.expectEqual(expected, addHalf(a, b));
}
