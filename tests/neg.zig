const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const neg = tern.monadic.neg;



test "neg inversion and involution" {
    const original: Tryte = .{
        .p = 0b1001,
        .n = 0b0110,
    };
    const expected_negated: Tryte = .{
        .p = 0b0110,
        .n = 0b1001,
    };

    const negated = neg(original);
    try std.testing.expectEqual(expected_negated, negated);

    const double_negated = neg(negated);
    try std.testing.expectEqual(original, double_negated);
}
