const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const eqvK = tern.dyadic.eqvK;



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
        .p = 0b100000001,
        .n = 0b001000100,
    };

    try std.testing.expectEqual(expected, eqvK(a, b));
}
