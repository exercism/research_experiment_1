pub fn longest_increasing_subslices<'a>(s: &'a [u8]) -> Vec<&'a [u8]> {
    // dynamic programming approach:

    // longest subsequence length: for each index i, stores length of longest
    // subsequence of s which ends at i
    let mut lssl = vec![0; s.len()];

    // last index: for each index i, stores last known index x at which s[x]==i
    let mut lidx = vec![-1_isize; 256];

    for idx in 0..s.len() {
        if idx > 0 &&  s[idx] > s[idx-1] {
            lssl[idx] = lssl[idx - 1] + 1;
        } else {
            // otherwise, this is the first index of a new sequence
            lssl[idx] = 0;
        }
        lidx[s[idx] as usize] = idx as isize;
    }

    let mut out = Vec::new();
    if let Some(len) = lssl.iter().filter(|&&l| l > 0).max() {
        for (high, _) in lssl.iter().enumerate().filter(|&(_, l)| l == len) {
            let low = high - len;
            out.push(&s[low..=high]);
        }
    }
    out
}
