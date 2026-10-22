// Bijections


// - > +
// 0 > 0
// + > -
pub fn neg(num_planes: anytype) @TypeOf(num_planes) {
    var result: @TypeOf(num_planes) = undefined;

    result.p = num_planes.n;
    result.n = num_planes.p;

    return result;
}

// - > 0
// 0 > +
// + > -
pub fn inc(num_planes: anytype) @TypeOf(num_planes) {
    var result: @TypeOf(num_planes) = undefined;

    result.p = ~(num_planes.p | num_planes.n);
    result.n = num_planes.p;

    return result;
}

// - > +
// 0 > -
// + > 0
pub fn dec(num_planes: anytype) @TypeOf(num_planes) {
    var result: @TypeOf(num_planes) = undefined;

    result.p = num_planes.n;
    result.n = ~(num_planes.p | num_planes.n);

    return result;
}



// Projections


// - > 0
// 0 > 0
// + > +
pub fn clampPos(num_planes: anytype) @TypeOf(num_planes) {
    var result: @TypeOf(num_planes) = undefined;

    result.p = num_planes.p;
    result.n = 0;

    return result;
}

// - > -
// 0 > 0
// + > 0
pub fn clampNeg(num_planes: anytype) @TypeOf(num_planes) {
    var result: @TypeOf(num_planes) = undefined;

    result.p = 0;
    result.n = num_planes.n;

    return result;
}



// Others non-invertible


// - > +
// 0 > 0
// + > +
pub fn abs(num_planes: anytype) @TypeOf(num_planes) {
    var result: @TypeOf(num_planes) = undefined;

    result.p = num_planes.p | num_planes.n;
    result.n = 0;

    return result;
}
