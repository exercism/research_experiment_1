use rust_1_a::longest_incrementing_subslice;

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
    longest_incrementing_subslice {
        test_example(&[1, 2, 4, 4, 5, 6, 7, 3, 2, 7, 8, 9, 1], &[4, 5, 6, 7]);
        test_head(&[1, 2, 3, 5], &[1, 2, 3]);
        test_tail(&[8, 1, 2, 3], &[1, 2, 3]);
        test_full(&[1, 2, 3], &[1, 2, 3]);
        test_min(&[2, 1, 0, 1, 2, 5, 6], &[0, 1, 2]);
        test_max(&[2, 5, 2, 253, 254, 255, 1], &[253, 254, 255]);
    }
}
