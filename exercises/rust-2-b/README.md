## Instructions

Your task is to extend existing code with new functionality. The code you'll be working with has a function named `disemvowel`, which removes all vowels from a string.

```rust
pub fn disemvowel(s: &str) -> String
```

You need to extend this function so in addition to removing the vowels, it replaces certain letters with digits and other characters to further obfuscate the message, according to this table:

| Letter | Replacement |
| ------ | ----------- |
| b      | 8           |
| c      | (           |
| g      | 9           |
| l      | 1           |
| s      | 5           |
| t      | +           |
| v      | ^           |

## Troubleshooting

When a test fails, a message is displaying what went wrong and for which input. Also, anything written to standard out is captured and will be displayed for failing tests as well. For passing tests, this data is suppressed for concision.

For debugging, the [`dbg!` macro](https://doc.rust-lang.org/std/macro.dbg.html) is the most useful way to report internal status information to standard out, but you can also use the [`println!` macro](https://doc.rust-lang.org/std/macro.println.html) to report arbitrary formatted data.
