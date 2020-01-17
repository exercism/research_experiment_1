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

    // let (_, seconds) = (0..=3600)
    //     .map(|seconds| (diff_degrees(big_hand, seconds), seconds))
    //     .min_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Less))
    //     .unwrap();
    // (seconds % 3600) as u64

    let mut range_min: u32 = 0;
    let mut range_max: u32 = 3600;

    loop {
        if range_min >= range_max {
            break;
        }

        let center = (range_min + range_max) / 2;
        if range_min == center {
            break;
        }

        let dd = diff_degrees(big_hand, center);
        if dd < 0.0 {
            range_max = center;
        } else if dd > 0.0 {
            range_min = center;
        }
    }

    // the subsequent diff might actually be smaller
    let rmdiff = diff_degrees(big_hand, range_min).abs();
    let subsdiff = diff_degrees(big_hand, range_min + 1).abs();
    let out = if subsdiff < rmdiff {
        (range_min + 1) as u64
    } else {
        range_min as u64
    };
    out % 3600
}

fn big_hand_degrees(hour: u32, seconds: u32) -> f64 {
    (hour as f64 * 30.0) + (seconds as f64 / 120.0)
}

fn little_hand_degrees(seconds: u32) -> f64 {
    seconds as f64 / 10.0
}

fn diff_degrees(hour: u32, seconds: u32) -> f64 {
    (big_hand_degrees(hour, seconds) - little_hand_degrees(seconds))
}
