const std = @import("std");
const tern = @import("ternlib");
const types = tern.types;



fn bits(comptime T: type) u16 {
    return @bitSizeOf(@FieldType(T, "p"));
}


test "standard widths" {
    try std.testing.expectEqual(1, bits(types.t1));
    try std.testing.expectEqual(3, bits(types.t3));
    try std.testing.expectEqual(9, bits(types.t9));
    try std.testing.expectEqual(27, bits(types.t27));
    try std.testing.expectEqual(81, bits(types.t81));
    try std.testing.expectEqual(243, bits(types.t243));
}

test "standard aliases" {
    try std.testing.expect(types.Trit == types.t1);
    try std.testing.expect(types.Triad == types.t3);
    try std.testing.expect(types.Tryte == types.t9);
    try std.testing.expect(types.Verbum == types.t27);
    try std.testing.expect(types.TriVerbum == types.t81);
    try std.testing.expect(types.NonaVerbum == types.t243);
}

test "standard short aliases" {
    try std.testing.expect(types.T == types.t1);
    try std.testing.expect(types.TD == types.t3);
    try std.testing.expect(types.TR == types.t9);
    try std.testing.expect(types.V == types.t27);
    try std.testing.expect(types.TV == types.t81);
    try std.testing.expect(types.NV == types.t243);
}


test "even widths" {
    try std.testing.expectEqual(2, bits(types.t2));
    try std.testing.expectEqual(6, bits(types.t6));
    try std.testing.expectEqual(12, bits(types.t12));
    try std.testing.expectEqual(24, bits(types.t24));
    try std.testing.expectEqual(48, bits(types.t48));
    try std.testing.expectEqual(96, bits(types.t96));
    try std.testing.expectEqual(192, bits(types.t192));
}

test "even aliases" {
    try std.testing.expect(types.Tweet == types.t2);
    try std.testing.expect(types.SetunTryte == types.t6);
    try std.testing.expect(types.Doze == types.t12);
    try std.testing.expect(types.DoubleDoze == types.t24);
    try std.testing.expect(types.QuadDoze == types.t48);
    try std.testing.expect(types.OctaDoze == types.t96);
    try std.testing.expect(types.HexDoze == types.t192);
}

test "even short aliases" {
    try std.testing.expect(types.TW == types.t2);
    try std.testing.expect(types.ST == types.t6);
    try std.testing.expect(types.D == types.t12);
    try std.testing.expect(types.DD == types.t24);
    try std.testing.expect(types.QD == types.t48);
    try std.testing.expect(types.OD == types.t96);
    try std.testing.expect(types.HD == types.t192);
}
