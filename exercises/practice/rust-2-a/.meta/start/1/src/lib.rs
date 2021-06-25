pub fn longest_incrementing_subslice(s: &[u8]) -> &[u8] {
    let mut lssl = vec![0; s.len()];
    let mut lidx = vec![-1_isize; 256];

    for idx in 0..s.len() {
        if idx > 0 && s[idx] > 0 && (lidx[s[idx] as usize - 1] + 1) as usize == idx {
            lssl[idx] = lssl[idx - 1] + 1;
        } else {
            lssl[idx] = 0;
        }
        lidx[s[idx] as usize] = idx as isize;
    }

    let (l, high) = lssl.iter().enumerate().map(|(i, l)| (l, i)).max().unwrap();
    let low = high - l;
    &s[low..=high]
}

pub fn longest_increasing_subslices<'a>(s: &'a [u8]) -> Vec<&'a [u8]> {
    unimplemented!()
}
