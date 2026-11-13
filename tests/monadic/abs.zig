const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const abs = tern.monadic.abs;



test "mapping and idempotence" {
    const original: Tryte = .{
        .p = 0b100100100,
        .n = 0b010010010,
    };
    const expected: Tryte = .{
        .p = 0b110110110,
        .n = 0b000000000,
    };

    const result = abs(original);
    try std.testing.expectEqual(expected, result);

    const again = abs(result);
    try std.testing.expectEqual(expected, again);
}


test "all negative" {
    const all_neg: Tryte = .{
        .p = 0,
        .n = 0b111111111,
    };
    const expected: Tryte = .{
        .p = 0b111111111,
        .n = 0,
    };

    try std.testing.expectEqual(expected, abs(all_neg));
}

test "all zero" {
    const all_zero: Tryte = .{
        .p = 0,
        .n = 0,
    };

    try std.testing.expectEqual(all_zero, abs(all_zero));
}
