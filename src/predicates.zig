// Predicates
// return boolean values per trit:
// - for false and + for true


// - > +
// 0 > -
// + > -
pub fn isNeg(num_planes: anytype) @TypeOf(num_planes) {
    var result: @TypeOf(num_planes) = undefined;

    result.p = num_planes.n;
    result.n = ~num_planes.n;

    return result;
}

// - > -
// 0 > +
// + > -
pub fn isUnk(num_planes: anytype) @TypeOf(num_planes) {
    var result: @TypeOf(num_planes) = undefined;
    const nonzero = num_planes.p | num_planes.n;

    result.p = ~nonzero;
    result.n = nonzero;

    return result;
}

// - > -
// 0 > -
// + > +
pub fn isPos(num_planes: anytype) @TypeOf(num_planes) {
    var result: @TypeOf(num_planes) = undefined;

    result.p = num_planes.p;
    result.n = ~num_planes.p;

    return result;
}

// if both plane bits are set, then - else +
// p n > result
// 0 0 > +
// 1 0 > +
// 0 1 > +
// 1 1 > -
pub fn isValid(num_planes: anytype) @TypeOf(num_planes) {
    var result: @TypeOf(num_planes) = undefined;
    const invalid = num_planes.p & num_planes.n;

    result.p = ~invalid;
    result.n = invalid;

    return result;
}
