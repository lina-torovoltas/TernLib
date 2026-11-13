const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const encodeHEP = tern.format.encodeHEP;
const decodeHEP = tern.format.decodeHEP;



test "encodeTrits and decodeTrits output format" {
    const original: Tryte = .{
        .p = 0b100100100,
        .n = 0b001001001,
    };

    var buf: [3]u8 = undefined;

    try std.testing.expectEqualStrings("HHH", encodeHEP(original, &buf));

    const decoded = try decodeHEP(original, "HHH");
    try std.testing.expectEqual(original, decoded);
}


test "encodeHEP and decodeHEP min and max" {
    const max: Tryte = .{
        .p = 0b111111111,
        .n = 0b000000000,
    };
    const min: Tryte = .{
        .p = 0b000000000,
        .n = 0b111111111,
    };

    var buf: [3]u8 = undefined;

    try std.testing.expectEqualStrings("MMM", encodeHEP(max, &buf));
    try std.testing.expectEqualStrings("mmm", encodeHEP(min, &buf));

    try std.testing.expectEqual(max, try decodeHEP(max, "MMM"));
    try std.testing.expectEqual(min, try decodeHEP(min, "mmm"));
}

test "decodeHEP zero padding and errors" {
    const planes: Tryte = .{
        .p = 0,
        .n = 0,
    };
    const original: Tryte = .{
        .p = 0b100100001,
        .n = 0b010001000,
    };
    const expected: Tryte = .{
        .p = 0b000000001,
        .n = 0b000000000,
    };

    const decoded = try decodeHEP(planes, "A");
    try std.testing.expectEqual(expected, decoded);

    try std.testing.expectEqual(planes, try decodeHEP(original, "="));

    try std.testing.expectError(error.TooLong, decodeHEP(planes, "AAAA"));
    try std.testing.expectError(error.InvalidChar, decodeHEP(planes, "fox"));
}
