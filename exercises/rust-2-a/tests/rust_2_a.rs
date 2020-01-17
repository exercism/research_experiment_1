use rust_2_a::{hands_match, Clock, Hand};

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

const STANDARD: Clock = Clock {
    big: Hand {
        name: "hour",
        qty: 12,
        seconds: 3600,
    },
    little: Hand {
        name: "minute",
        qty: 60,
        seconds: 60,
    },
};

const TWENTY_FOUR: Clock = Clock {
    big: Hand {
        name: "hour",
        qty: 24,
        seconds: 3600,
    },
    little: Hand {
        name: "minute",
        qty: 60,
        seconds: 60,
    },
};

const LONG_NOW: Clock = Clock {
    big: Hand {
        name: "millenium",
        qty: 10,
        seconds: 60 * 60 * 24 * 365 * 1000,
    },
    little: Hand {
        name: "century",
        qty: 100,
        seconds: 60 * 60 * 24 * 365 * 100,
    },
};

tests! {
    hands_match {
        test_std_01(327,  &STANDARD, 1);
        test_std_02(655,  &STANDARD, 2);
        test_std_03(982,  &STANDARD, 3);
        test_std_04(1309, &STANDARD, 4);
        test_std_05(1636, &STANDARD, 5);
        test_std_06(1964, &STANDARD, 6);
        test_std_07(2291, &STANDARD, 7);
        test_std_08(2618, &STANDARD, 8);
        test_std_09(2945, &STANDARD, 9);
        test_std_10(3273, &STANDARD, 10);
        test_std_11(0,    &STANDARD, 11);
        test_std_12(0,    &STANDARD, 12);
        test_24_01(157,   &TWENTY_FOUR, 1);
        test_24_02(313,   &TWENTY_FOUR, 2);
        test_24_03(470,   &TWENTY_FOUR, 3);
        test_24_23(0,     &TWENTY_FOUR, 23);
        test_long_1(3504000000,   &LONG_NOW, 1);
        test_long_5(17520000000,   &LONG_NOW, 5);
        test_long_9(0,   &LONG_NOW, 9);
    }
}
