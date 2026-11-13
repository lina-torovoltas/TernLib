const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const clampNeg = tern.monadic.clampNeg;



test "mapping and idempotence" {
    const original: Tryte = .{
        .p = 0b100100100,
        .n = 0b010010010,
    };
    const expected: Tryte = .{
        .p = 0b000000000,
        .n = 0b010010010,
    };

    const result = clampNeg(original);
    try std.testing.expectEqual(expected, result);

    const again = clampNeg(result);
    try std.testing.expectEqual(expected, again);
}


test "all positive" {
    const all_pos: Tryte = .{
        .p = 0b111111111,
        .n = 0,
    };
    const all_zero: Tryte = .{
        .p = 0,
        .n = 0,
    };

    try std.testing.expectEqual(all_zero, clampNeg(all_pos));
}
