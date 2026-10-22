// Mod 3 arithmetic without carry


// \ b - 0 +
// a
// -   + - 0
// 0   - 0 +
// +   0 + -
pub fn addMod(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    const num1_zero = ~(num1.p | num1.n);
    const num2_zero = ~(num2.p | num2.n);

    var result: @TypeOf(num1) = undefined;

    result.p = (num1.p & num2_zero) | (num2.p & num1_zero) | (num1.n & num2.n);
    result.n = (num1.n & num2_zero) | (num2.n & num1_zero) | (num1.p & num2.p);

    return result;
}

// \ b - 0 +
// a
// -   0 - +
// 0   + 0 -
// +   - + 0
pub fn subMod(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    const num1_zero = ~(num1.p | num1.n);
    const num2_zero = ~(num2.p | num2.n);

    var result: @TypeOf(num1) = undefined;

    result.p = (num1.p & num2_zero) | (num2.n & num1_zero) | (num1.n & num2.p);
    result.n = (num1.n & num2_zero) | (num2.p & num1_zero) | (num1.p & num2.n);

    return result;
}

// \ b - 0 +
// a
// -   + 0 -
// 0   0 0 0
// +   - 0 +
pub fn mulMod(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    var result: @TypeOf(num1) = undefined;

    result.p = (num1.p & num2.p) | (num1.n & num2.n);
    result.n = (num1.p & num2.n) | (num1.n & num2.p);

    return result;
}



// Order and consensus


// \ b - 0 +
// a
// -   - - -
// 0   - 0 0
// +   - 0 +
pub fn tMin(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    var result: @TypeOf(num1) = undefined;

    result.p = num1.p & num2.p;
    result.n = num1.n | num2.n;

    return result;
}

// \ b - 0 +
// a
// -   - 0 +
// 0   0 0 +
// +   + + +
pub fn tMax(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    var result: @TypeOf(num1) = undefined;

    result.p = num1.p | num2.p;
    result.n = num1.n & num2.n;

    return result;
}

// \ b - 0 +
// a
// -   - 0 0
// 0   0 0 0
// +   0 0 +
pub fn consensus(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    var result: @TypeOf(num1) = undefined;

    result.p = num1.p & num2.p;
    result.n = num1.n & num2.n;

    return result;
}



// Implication and equivalence


// Kleene implication
//
// \ b - 0 +
// a
// -   + + +
// 0   0 0 +
// +   - 0 +
pub fn impK(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    var result: @TypeOf(num1) = undefined;

    result.p = num1.n | num2.p;
    result.n = num1.p & num2.n;

    return result;
}

// Lukasiewicz implication
//
// \ b - 0 +
// a
// -   + + +
// 0   0 + +
// +   - 0 +
pub fn impL(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    var result: @TypeOf(num1) = undefined;

    const both_zero = ~(num1.p | num1.n) & ~(num2.p | num2.n);

    result.p = num1.n | num2.p | both_zero;
    result.n = num1.p & num2.n;

    return result;
}

// Kleene equivalence, same as mulMod
//
// \ b - 0 +
// a
// -   + 0 -
// 0   0 0 0
// +   - 0 +
pub const eqvK = mulMod;


// Lukasiewicz equivalence
//
// \ b - 0 +
// a
// -   + 0 -
// 0   0 + 0
// +   - 0 +
pub fn eqvL(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    var result: @TypeOf(num1) = undefined;

    result.p = ~((num1.p ^ num2.p) | (num1.n ^ num2.n));
    result.n = (num1.p & num2.n) | (num1.n & num2.p);

    return result;
}



// Functionally complete


// Webb function, same as inc(max(a, b))
//
// \ b - 0 +
// a
// -   0 + -
// 0   + + -
// +   - - -
pub fn tWebb(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    var result: @TypeOf(num1) = undefined;

    result.p = ~(num1.p | num2.p | (num1.n & num2.n));
    result.n = num1.p | num2.p;

    return result;
}



// Other logical operations


// \ b - 0 +
// a
// -   - 0 +
// 0   0 0 0
// +   + 0 -
pub fn xorJ(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    var result: @TypeOf(num1) = undefined;

    result.p = (num1.p & num2.n) | (num1.n & num2.p);
    result.n = (num1.p & num2.p) | (num1.n & num2.n);

    return result;
}

// \ b - 0 +
// a
// -   - - 0
// 0   - 0 +
// +   0 + +
pub fn any(num1: anytype, num2: @TypeOf(num1)) @TypeOf(num1) {
    var result: @TypeOf(num1) = undefined;

    result.p = (num1.p & num2.p) | (num1.p & ~num2.n) | (num2.p & ~num1.n);
    result.n = (num1.n & num2.n) | (num1.n & ~num2.p) | (num2.n & ~num1.p);

    return result;
}
