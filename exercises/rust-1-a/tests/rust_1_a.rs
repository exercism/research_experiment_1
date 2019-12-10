use rust_1_a::hands_match;

macro_rules! tests {
    ($test_func:ident {
        $( $(#[$attr:meta])* $test_name:ident($param:expr, $expect:expr); )+
    }) => {
        $(
            $(#[$attr])*
            #[test]
            fn $test_name() {
                assert_eq!($test_func( $param ), $expect);
            }
        )+
    }
}

tests! {
    hands_match {
        test_01(1,  327);
        test_02(2,  655);
        test_03(3,  982);
        test_04(4,  1309);
        test_05(5,  1636);
        test_06(6,  1964);
        test_07(7,  2291);
        test_08(8,  2618);
        test_09(9,  2945);
        test_10(10, 3273);
        test_11(11, 0); // these two cases are a fun degenerate result
        test_12(12, 0); // can you work out why they act like this?
    }
}
