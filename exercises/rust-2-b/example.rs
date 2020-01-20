// input: some string
// output: that string with all vowels removed
pub fn disemvowel(s: &str) -> String {
    s.chars()
        .filter(|c| {
            let l = c.to_ascii_lowercase();
            !(l == 'a' || l == 'e' || l == 'i' || l == 'o' || l == 'u')
        })
        .map(|c| match c.to_ascii_lowercase() {
            'b' => '8',
            'c' => '(',
            'g' => '9',
            'l' => '1',
            's' => '5',
            't' => '+',
            'v' => '^',
            _ => c,
        })
        .collect()
}
