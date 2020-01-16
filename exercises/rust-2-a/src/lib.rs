pub struct Hand {
    pub name: &'static str, // for human-readable documentation only
    pub qty: u32,           // how many intervals appear on the clock face
    pub seconds: u32,       // how many seconds are in this period of time
}

pub struct Clock {
    pub big: Hand,
    pub little: Hand,
}

pub fn hands_match(clock: &Clock, big_hand: u32) -> u64 {
    unimplemented!()
}
