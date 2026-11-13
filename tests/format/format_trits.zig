const std = @import("std");
const tern = @import("ternlib");
const Tryte = tern.types.Tryte;
const encodeTrits = tern.format.encodeTrits;
const decodeTrits = tern.format.decodeTrits;



test "encodeTrits and decodeTrits output format" {
    const original: Tryte = .{
        .p = 0b100100100,
        .n = 0b001001001,
    };

    var buf: [9]u8 = undefined;

    try std.testing.expectEqualStrings("+0-+0-+0-", encodeTrits(original, "-0+", &buf));
    try std.testing.expectEqualStrings("+=-+=-+=-", encodeTrits(original, "-=+", &buf));
    try std.testing.expectEqualStrings("P0NP0NP0N", encodeTrits(original, "N0P", &buf));
    try std.testing.expectEqualStrings("10T10T10T", encodeTrits(original, "T01", &buf));

    const decoded = try decodeTrits(original, "+0-+0-+0-", "-0+");
    try std.testing.expectEqual(original, decoded);
}


test "decodeTrits zero padding and errors" {
    const planes: Tryte = .{
        .p = 0,
        .n = 0,
    };
    const expected: Tryte = .{
        .p = 0b000000001,
        .n = 0b000000100,
    };

    const decoded = try decodeTrits(planes, "00-0+", "-0+");
    try std.testing.expectEqual(expected, decoded);

    try std.testing.expectError(error.TooLong, decodeTrits(planes, "++++++++++", "-0+"));
    try std.testing.expectError(error.InvalidChar, decodeTrits(planes, "fox", "-0+"));
}
