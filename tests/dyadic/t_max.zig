const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const tMax = tern.dyadic.tMax;



test "full truth table" {
    const a: Tryte = .{
        .p = 0b000000111,
        .n = 0b111000000,
    };
    const b: Tryte = .{
        .p = 0b001001001,
        .n = 0b100100100,
    };
        
    const expected: Tryte = .{
        .p = 0b001001111,
        .n = 0b100000000,
    };

    try std.testing.expectEqual(expected, tMax(a, b));
}
