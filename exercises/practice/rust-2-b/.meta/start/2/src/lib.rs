// input: some string
// output: that string with all vowels removed
pub fn disemvowel(s: &str) -> String {
    let mut out = Vec::with_capacity(s.len());
    for &b in s.as_bytes().iter() {
        let mut c = b;
        if c < 128 {
            // ascii
            c |= 1 << 5; // lowercase
        }
        if !(c == b'a' || c == b'e' || c == b'i' || c == b'o' || c == b'u') {
            out.push(b);
        }
    }
    String::from_utf8(out).unwrap()
}
