// each trit is represented by two planes:
// p is the positive plane for +1
// n is the negative plane for -1
//
// if p = 1 and n = 0 then +
// if p = 0 and n = 1 then -
// if p = 0 and n = 0 then 0
//
// p = 1 and n = 1 is invalid
pub fn TernPlanes(comptime PlaneInt: type) type {
    return struct {
        p: PlaneInt,
        n: PlaneInt,
    };
}


// standard widths 3^n with naming aliases

pub const t1 = TernPlanes(u1);
pub const t3 = TernPlanes(u3);
pub const t9 = TernPlanes(u9);
pub const t27 = TernPlanes(u27);
pub const t81 = TernPlanes(u81);
pub const t243 = TernPlanes(u243);

pub const Trit = t1;
pub const Triad = t3;
pub const Tryte = t9;
pub const Verbum = t27;
pub const TriplexVerbum = t81;
pub const NovemplexVerbum = t243;


// non-standard even widths

pub const t2 = TernPlanes(u2);
pub const t6 = TernPlanes(u6);
pub const t12 = TernPlanes(u12);
pub const t24 = TernPlanes(u24);
pub const t48 = TernPlanes(u48);
pub const t96 = TernPlanes(u96);
pub const t192 = TernPlanes(u192);
