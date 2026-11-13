const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const addMod = tern.dyadic.addMod;



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
        .p = 0b100001010,
        .n = 0b010100001,
    };

    try std.testing.expectEqual(expected, addMod(a, b));
}
