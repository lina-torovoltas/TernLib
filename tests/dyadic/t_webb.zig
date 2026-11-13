const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const tWebb = tern.dyadic.tWebb;



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
        .p = 0b010110000,
        .n = 0b001001111,
    };

    try std.testing.expectEqual(expected, tWebb(a, b));
}
