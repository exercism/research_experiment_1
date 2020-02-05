use rust_2_a::longest_increasing_subslices;

macro_rules! tests {
    ($test_func:ident {
        $( $(#[$attr:meta])* $test_name:ident($param:expr, $expect:expr); )+
    }) => {
        $(
            $(#[$attr])*
            #[test]
            fn $test_name() {
                let expect: &[&[u8]] = $expect;
                assert_eq!($test_func( $param ), expect);
            }
        )+
    }
}

tests! {
    longest_increasing_subslices {
        test_old_example(&[1, 2, 4, 4, 5, 6, 7, 3, 2, 7, 8, 9, 1], &[&[4, 5, 6, 7], &[2, 7, 8, 9]]);
        test_head(&[1, 2, 3, 3], &[&[1, 2, 3]]);
        test_tail(&[8, 1, 2, 3], &[&[1, 2, 3]]);
        test_full(&[1, 2, 3], &[&[1, 2, 3]]);
        test_min(&[2, 1, 0, 1, 2, 5, 6, 6], &[&[0, 1, 2, 5, 6]]);
        test_max(&[2, 253, 253, 254, 255, 1], &[&[253, 254, 255]]);
        test_empty(&[], &[]);
        test_no_increasing(&[4, 2, 1], &[]);
        test_static(&[5, 5, 5], &[]);
        test_separated(&[10, 1, 3, 5, 0], &[&[1, 3, 5]]);
        test_pair(&[5, 2, 3, 4, 4, 1, 3, 5, 0], &[&[2, 3, 4], &[1, 3, 5]]);
        test_example(&[5, 2, 3, 4, 4, 1, 3, 5, 0, 1], &[&[2, 3, 4], &[1, 3, 5]]);
        test_triple(&[8, 9, 4, 5, 1, 2], &[&[8, 9], &[4, 5], &[1, 2]]);
    }
}
