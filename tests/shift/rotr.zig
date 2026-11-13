const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const rotr = tern.shift.rotr;



test "wraps bottom trits to the top" {
    const original: Tryte = .{
        .p = 0b110000001,
        .n = 0b001100000,
    };
    const expected: Tryte = .{
        .p = 0b011100000,
        .n = 0b000011000,
    };

    try std.testing.expectEqual(expected, rotr(original, 2));
}

test "by full width returns original" {
    const original: Tryte = .{
        .p = 0b110000001,
        .n = 0b001100000,
    };

    try std.testing.expectEqual(original, rotr(original, 9));
}
