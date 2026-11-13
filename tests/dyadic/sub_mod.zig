const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const subMod = tern.dyadic.subMod;



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
        .p = 0b001100010,
        .n = 0b010001100,
    };

    try std.testing.expectEqual(expected, subMod(a, b));
}
