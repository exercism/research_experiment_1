pub struct Hand {
    pub name: &'static str, // for human-readable documentation only
    pub qty: u32,           // how many intervals appear on the clock face
    pub seconds: u64,       // how many seconds are in this period of time
}

pub struct Clock {
    pub big: Hand,
    pub little: Hand,
}

pub fn hands_match(clock: &Clock, mut big_hand: u32) -> u64 {
    big_hand %= clock.big.qty;
    // let's solve this analytically.
    //
    // other plausible solution strategies:
    // - brute force: iterate through the seconds, find the best match
    // - binary search: if the minute hand position is greater than the
    //   big_hand hand position, go back; otherwise, fwd
    //
    // to get the position of the big hand (degrees) given the (fractional) big_hand_f:
    //
    //   b_hand = big_hand * (360 / clock.big.qty)
    //
    // to get the position of the little hand (degrees) given the (fractional) big_hand_f:
    //
    //   m_hand = big_hand * 360
    //
    // note that the degree position of the big and little hands are not restricted
    // to a standard 360 degree circle. the hand positions are still equal when
    // the difference between the two is 360 * n for some n, where n is the number
    // of times the little hand has lapped the big hand:
    //
    //   m_hand - h_hand = 360 * n
    //   (big_hand * 360) - (big_hand * (360 / clock.big.qty)) = n * 360
    //   big_hand * 360 * (1 - (1/clock.big.qty)) = n * 360
    //   big_hand * (1 - (1 / clock.big.qty)) = n
    //   big_hand = n / (1 - (1 / clock.big.qty))
    //
    // however, this approach only finds the fractional hour for which the hands
    // align; the problem asked for the seconds after the hour. Luckily, that's
    // a straightforward modification:
    //
    ((big_hand as f64 / (1.0 - (1.0 / clock.big.qty as f64))) % 1.0 * (clock.big.seconds as f64))
        .round() as u64
}
