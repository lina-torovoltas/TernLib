const std = @import("std");



// encodes trits to strings and decodes them back with a custom 3 character alphabet
// examples:
// -0+, N0P, T01, -=+
// (minus, zero, plus)


pub fn encodeTrits(num_planes: anytype, chars: *const [3]u8, buf: *[@bitSizeOf(@TypeOf(num_planes.p))]u8) []u8 {
    const width = @bitSizeOf(@TypeOf(num_planes.p));

    for (0..width) |i| {
        const shift: std.math.Log2Int(@TypeOf(num_planes.p)) = @intCast(width - 1 - i);
        const bit = @as(@TypeOf(num_planes.p), 1) << shift;

        if (num_planes.p & bit != 0) {
            buf[i] = chars[2];

        } else if (num_planes.n & bit != 0) {
            buf[i] = chars[0];

        } else {
            buf[i] = chars[1];
        }
    }

    return buf[0..width];
}

pub fn decodeTrits(num_planes: anytype, str: []const u8, chars: *const [3]u8) error{ TooLong, InvalidChar }!@TypeOf(num_planes) {
    const width = @bitSizeOf(@TypeOf(num_planes.p));

    if (str.len > width) {
        return error.TooLong;
    }

    var result: @TypeOf(num_planes) = undefined;

    result.p = 0;
    result.n = 0;

    for (str, 0..) |char, i| {
        const shift: std.math.Log2Int(@TypeOf(num_planes.p)) = @intCast(str.len - 1 - i);
        const bit = @as(@TypeOf(num_planes.p), 1) << shift;

        if (char == chars[2]) {
            result.p |= bit;

        } else if (char == chars[0]) {
            result.n |= bit;

        } else if (char != chars[1]) {
            return error.InvalidChar;
        }
    }

    return result;
}



// encodes trits to HEP strings and decodes them back, one character per tribble (3 trits)
// plane width must be a multiple of 3!!!


const hep_digits = "mlkjihgfedcba=ABCDEFGHIJKLM";

fn get_tribble(num_planes: anytype, shift: std.math.Log2Int(@TypeOf(num_planes.p))) i32 {
    var value: i32 = 0;
    var weight: i32 = 1;

    for (0..3) |i| {
        const bit_position = shift + @as(std.math.Log2Int(@TypeOf(num_planes.p)), @intCast(i));
        const bit = @as(@TypeOf(num_planes.p), 1) << bit_position;

        var trit: i32 = 0;

        if (num_planes.p & bit != 0) {
            trit = 1;

        } else if (num_planes.n & bit != 0) {
            trit = -1;
        }

        value += trit * weight;
        weight *= 3;
    }

    return value;
}

pub fn encodeHEP(num_planes: anytype, buf: *[@bitSizeOf(@TypeOf(num_planes.p)) / 3]u8) []u8 {
    const width = @bitSizeOf(@TypeOf(num_planes.p));
    const len = width / 3;

    if (width % 3 != 0) {
        @compileError("plane width must be a multiple of 3!!!");
    }

    for (0..len) |i| {
        const shift: std.math.Log2Int(@TypeOf(num_planes.p)) = @intCast((len - 1 - i) * 3);
        const value = get_tribble(num_planes, shift);

        buf[i] = hep_digits[@intCast(value + 13)];
    }

    return buf[0..len];
}

pub fn decodeHEP(num_planes: anytype, str: []const u8) error{ TooLong, InvalidChar }!@TypeOf(num_planes) {
    const width = @bitSizeOf(@TypeOf(num_planes.p));
    const len = width / 3;

   if (width % 3 != 0) {
        @compileError("plane width must be a multiple of 3!!!");
    }

    if (str.len > len) {
        return error.TooLong;
    }

    var result: @TypeOf(num_planes) = undefined;

    result.p = 0;
    result.n = 0;

    for (str, 0..) |char, i| {
        const index = std.mem.indexOfScalar(u8, hep_digits, char) orelse return error.InvalidChar;
        const shift: std.math.Log2Int(@TypeOf(num_planes.p)) = @intCast((str.len - 1 - i) * 3);

        var value: i32 = @as(i32, @intCast(index)) - 13;

        for (0..3) |j| {
            const bit = @as(@TypeOf(num_planes.p), 1) << (shift + @as(std.math.Log2Int(@TypeOf(num_planes.p)), @intCast(j)));

            const trit: i32 = @mod(value + 1, 3) - 1;

            if (trit == 1) {
                result.p |= bit;

            } else if (trit == -1) {
                result.n |= bit;
            }

            value = @divExact(value - trit, 3);
        }
    }

    return result;
}
