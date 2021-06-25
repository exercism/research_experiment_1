// input: some string
// output: that string with all vowels removed
pub fn disemvowel(s: &str) -> String {
    let mut out = s.to_string();
    out = out.replace("a", "");
    out = out.replace("e", "");
    out = out.replace("i", "");
    out = out.replace("o", "");
    out = out.replace("u", "");
    out = out.replace("A", "");
    out = out.replace("E", "");
    out = out.replace("I", "");
    out = out.replace("O", "");
    out = out.replace("U", "");
    out
}
