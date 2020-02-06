pub fn longest_incrementing_subslice(s: &[u8]) -> &[u8] {
    // dynamic programming approach:

    // longest subsequence length: for each index i, stores length of longest
    // subsequence of s which ends at i
    let mut lssl = vec![0; s.len()];

    // last index: for each index i, stores last known index x at which s[x]==i
    let mut lidx = vec![-1_isize; 256];

    for idx in 0..s.len() {
        // if the last position of the previous value is one less than the current
        // index, then we can just continue the previous subsequence
        if idx > 0 && s[idx] > 0 && (lidx[s[idx] as usize - 1] + 1) as usize == idx {
            lssl[idx] = lssl[idx - 1] + 1;
        } else {
            // otherwise, this is the first index of a new sequence
            lssl[idx] = 0;
        }
        lidx[s[idx] as usize] = idx as isize;
    }

    let (l, high) = lssl.iter().enumerate().map(|(i, l)| (l, i)).max().unwrap();
    let low = high - l;
    &s[low..=high]
}
