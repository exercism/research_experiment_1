use rust_1_b::disemvowel;

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
        test_disemvowel("dsmvwl",  "disemvowel");
        test_alphabet("bcdfghjklmnpqrstvwxyz", "abcdefghijklmnopqrstuvwxyz");
        test_uppercase(" HRRBL HTFL MSSG FRM  TRLL", "A HORRIBLE HATEFUL MESSAGE FROM A TROLL");
        test_description("Ths tchnq, clld _dsmvwlmnt_, s ftn mplyd t rdc th ffctvnss f trll mssgs n nln fr.", "This technique, called _disemvowelment_, is often employed to reduce the effectiveness of troll messages in online fora.");
        test_non_ascii("「Dsmvwlmnt」はSC文字に対してのみ有効です。", "「Disemvowelment」はASCII文字に対してのみ有効です。");
    }
}
