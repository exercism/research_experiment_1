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
    ((big_hand as f64 * 12.0 / 11.0) % 1.0 * 3600.0).round() as u64
}
