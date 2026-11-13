const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const anyJ = tern.dyadic.anyJ;



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
        .p = 0b000001011,
        .n = 0b110100000,
    };

    try std.testing.expectEqual(expected, anyJ(a, b));
}
