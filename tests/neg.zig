const std = @import("std");
const tern = @import("ternlib");



const TernPlanes = tern.TernPlanes(u8);


test "neg inversion and involution" {
    const original = TernPlanes{
        .p = 0b1001,
        .n = 0b0110,
    };
    const expected_negated = TernPlanes{
        .p = 0b0110,
        .n = 0b1001,
    };

    const negated = tern.neg(original);
    try std.testing.expectEqual(expected_negated, negated);

    const double_negated = tern.neg(negated);
    try std.testing.expectEqual(original, double_negated);
}
