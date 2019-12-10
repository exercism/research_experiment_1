// input: the hour, 1-12 inclusive
// output: seconds after the hour at which the hands are best aligned
pub fn hands_match(mut hour: u8) -> u32 {
    hour %= 12;
    // let's solve this analytically.
    //
    // other plausible solution strategies:
    // - brute force: iterate through the seconds, find the best match
    // - binary search: if the minute hand position is greater than the
    //   hour hand position, go back; otherwise, fwd
    //
    // to get the position of the hour hand (degrees) given the (fractional) hour:
    //
    //   h_hand = hour * 30
    //
    // to get the position of the minute hand (degrees) given the (fractional) hour:
    //
    //   m_hand = hour * 360
    //
    // note that the degree position of the hour and minute hands are not restricted
    // to a standard 360 degree circle. the hand positions are still equal when
    // the difference between the two is 360 * n for some n, where n is the number
    // of times the minute hand has lapped the hour hand:
    //
    //   m_hand - h_hand = 360 * n
    //   (hour * 360) - (hour * 30) = n * 360
    //   330 * hour = n * 360
    //   hour = n * 12 / 11
    //
    // however, this approach only finds the fractional hour for which the hands
    // align; the problem asked for the seconds after the hour. Luckily, that's
    // a straightforward modification:
    //
    ((hour as f64 * 12.0 / 11.0) % 1.0 * 3600.0).round() as u32
}
