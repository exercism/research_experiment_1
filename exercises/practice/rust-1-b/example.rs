// input: some string
// output: that string with all vowels removed
pub fn disemvowel(s: &str) -> String {
    s.chars()
        .filter(|c| {
            let l = c.to_ascii_lowercase();
            !(l == 'a' || l == 'e' || l == 'i' || l == 'o' || l == 'u')
        })
        .collect()
}
