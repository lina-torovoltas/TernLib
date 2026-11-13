const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const dec = tern.monadic.dec;



test "mapping and cycle of three" {
    const original: Tryte = .{
        .p = 0b100100100,
        .n = 0b010010010,
    };
    const expected_once: Tryte = .{
        .p = 0b010010010,
        .n = 0b001001001,
    };
    const expected_twice: Tryte = .{
        .p = 0b001001001,
        .n = 0b100100100,
    };

    const once = dec(original);
    try std.testing.expectEqual(expected_once, once);

    const twice = dec(once);
    try std.testing.expectEqual(expected_twice, twice);

    const thrice = dec(twice);
    try std.testing.expectEqual(original, thrice);
}
