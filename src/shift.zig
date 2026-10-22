const std = @import("std");



// Shifts


// shifts left, filling with 0
pub fn shl(num_planes: anytype, shift: usize) @TypeOf(num_planes) {
    const PlaneInt = @TypeOf(num_planes.p);

    var result: @TypeOf(num_planes) = undefined;

    result.p = std.math.shl(PlaneInt, num_planes.p, shift);
    result.n = std.math.shl(PlaneInt, num_planes.n, shift);

    return result;
}

// shifts right, filling with 0
pub fn shr(num_planes: anytype, shift: usize) @TypeOf(num_planes) {
    const PlaneInt = @TypeOf(num_planes.p);

    var result: @TypeOf(num_planes) = undefined;

    result.p = std.math.shr(PlaneInt, num_planes.p, shift);
    result.n = std.math.shr(PlaneInt, num_planes.n, shift);

    return result;
}



// Rotations


// rotates left
// trits shifted out re-enter at the bottom
pub fn rotl(num_planes: anytype, shift: usize) @TypeOf(num_planes) {
    const PlaneInt = @TypeOf(num_planes.p);

    var result: @TypeOf(num_planes) = undefined;

    result.p = std.math.rotl(PlaneInt, num_planes.p, shift);
    result.n = std.math.rotl(PlaneInt, num_planes.n, shift);

    return result;
}

// rotates right
// trits shifted out re-enter at the top
pub fn rotr(num_planes: anytype, shift: usize) @TypeOf(num_planes) {
    const PlaneInt = @TypeOf(num_planes.p);

    var result: @TypeOf(num_planes) = undefined;

    result.p = std.math.rotr(PlaneInt, num_planes.p, shift);
    result.n = std.math.rotr(PlaneInt, num_planes.n, shift);

    return result;
}
