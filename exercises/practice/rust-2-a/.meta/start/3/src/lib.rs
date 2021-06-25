pub fn longest_incrementing_subslice(s: &[u8]) -> &[u8] {
    let lssl: Vec<usize> = s
        .iter()
        .enumerate()
        .map(|(start_idx, &v1)| {
            s.iter()
                .enumerate()
                .skip(start_idx + 1)
                .take_while(|(end_idx, &v2)| v2 > v1 && (v2 - v1) as usize == end_idx - start_idx)
                .count()
        })
        .collect();
    let (longest, start) = lssl.iter().enumerate().map(|(i, v)| (v, i)).max().unwrap();
    &s[start..=start + longest]
}

pub fn longest_increasing_subslices<'a>(s: &'a [u8]) -> Vec<&'a [u8]> {
    unimplemented!()
}
