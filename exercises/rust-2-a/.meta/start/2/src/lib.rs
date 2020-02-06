pub fn longest_incrementing_subslice(s: &[u8]) -> &[u8] {
    let mut lssl = vec![0; s.len()];

    for start_idx in 0..(s.len() - 1) {
        for end_idx in (start_idx + 1)..s.len() {
            if s[end_idx] < s[end_idx - 1] || s[end_idx] - s[end_idx - 1] != 1 {
                break;
            }
            lssl[start_idx] = end_idx - start_idx;
        }
    }

    let (longest, start) = lssl.iter().enumerate().map(|(i, v)| (v, i)).max().unwrap();
    &s[start..=start + longest]
}

pub fn longest_increasing_subslices<'a>(s: &'a [u8]) -> Vec<&'a [u8]> {
    unimplemented!()
}
