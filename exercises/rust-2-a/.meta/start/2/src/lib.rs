pub struct Hand {
    pub name: &'static str, // for human-readable documentation only
    pub qty: u32,           // how many intervals appear on the clock face
    pub seconds: u64,       // how many seconds are in this period of time
}

pub struct Clock {
    pub big: Hand,
    pub little: Hand,
}

pub fn hands_match(_clock: &Clock, mut big_hand: u32) -> u64 {
    big_hand %= 12;

    let (_, seconds) = (0..=3600)
        .map(|seconds| (diff_degrees(big_hand, seconds), seconds))
        .min_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Less))
        .unwrap();
    (seconds % 3600) as u64
}

fn big_hand_degrees(hour: u32, seconds: u32) -> f64 {
    (hour as f64 * 30.0) + (seconds as f64 / 120.0)
}

fn little_hand_degrees(seconds: u32) -> f64 {
    seconds as f64 / 10.0
}

fn diff_degrees(hour: u32, seconds: u32) -> f64 {
    (big_hand_degrees(hour, seconds) - little_hand_degrees(seconds)).abs()
}
