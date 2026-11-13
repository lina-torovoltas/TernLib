test {
    _ = @import("formats/format_hep.zig");
    _ = @import("formats/format_trits.zig");
    _ = @import("monadic/neg.zig");
    _ = @import("monadic/dec.zig");
    _ = @import("monadic/inc.zig");
    _ = @import("monadic/abs.zig");
    _ = @import("monadic/clamp_pos.zig");
    _ = @import("monadic/clamp_neg.zig");
    _ = @import("predicates/is_valid.zig");
    _ = @import("predicates/is_neg.zig");
    _ = @import("predicates/is_unk.zig");
    _ = @import("predicates/is_pos.zig");
    _ = @import("shifts/shl.zig");
    _ = @import("shifts/shr.zig");
    _ = @import("shifts/rotl.zig");
    _ = @import("shifts/rotr.zig");
}
