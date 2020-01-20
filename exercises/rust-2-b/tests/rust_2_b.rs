use rust_2_b::disemvowel;

macro_rules! tests {
    ($test_func:ident {
        $( $(#[$attr:meta])* $test_name:ident($expect:expr, $( $param:expr ),*); )+
    }) => {
        $(
            $(#[$attr])*
            #[test]
            fn $test_name() {
                assert_eq!($test_func( $( $param ),* ), $expect);
            }
        )+
    }
}

tests! {
    disemvowel {
        test_disemvowel("d5m^w1",  "disemvowel");
        test_alphabet("8(df9hjk1mnpqr5+^wxyz", "abcdefghijklmnopqrstuvwxyz");
        test_uppercase(" HRR81 H+F1 M559 FRM  +R11", "A HORRIBLE HATEFUL MESSAGE FROM A TROLL");
        test_description("+h5 +(hnq, (11d _d5m^w1mn+_, 5 f+n mp1yd + rd( +h ff(+^n55 f +r11 m5595 n n1n fr.", "This technique, called _disemvowelment_, is often employed to reduce the effectiveness of troll messages in online fora.");
        test_non_ascii("「D5m^w1mn+」は5(文字に対してのみ有効です。", "「Disemvowelment」はASCII文字に対してのみ有効です。");
    }
}
