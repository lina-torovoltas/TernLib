const dyadic = @import("dyadic.zig");



pub fn addHalf(num1: anytype, num2: @TypeOf(num1)) struct {sum: @TypeOf(num1), carry: @TypeOf(num1)} {
    var result: @TypeOf(addHalf(num1, num2)) = undefined;
    
    result.sum = dyadic.addMod(num1, num2);
    result.carry = dyadic.consensus(num1, num2);

    return result;
}
