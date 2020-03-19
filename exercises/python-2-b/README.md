# Introduction

This is Part 2 of our research into differences in the ways in which people write Python. This exercise should take 10-15 minutes for a programmer who is proficient in Python. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

# Instructions

Your task is to extend existing code with new functionality. The existing code can transmit a [`str`][str] comprised of [ASCII][ascii] characters in the [NATO Phonetic Alphabet][nato] and read it back again. The Phonetic Alphabet is used in aviation, shipping, and military applications to allow clear, unambiguous communication of words over telephone and radio transmissions.

The code you'll be working with has a function named `transmit` that takes an arbitrary message and returns it as a space-separated NATO code word transmission. Although punctuation and whitespace may be present in the orginal sentence only ASCII letters and digits need to be converted. The case of the letters is irrelevant, but the resulting transmission will be all upper case.

```python
>>> transmit("Hello, World!")
"HOTEL ECHO LIMA LIMA OSCAR WHISKEY OSCAR ROMEO LIMA DELTA"

>>> transmit("NCC-1701-D")
"NOVEMBER CHARLIE CHARLIE ONE SEVEN ZERO ONE DELTA"
```

The code also has a function named `receive` that will take a NATO code word transmission formatted as described above and convert it back to a readable message. Because the phonetic alphabet is a lossy transmission format only the letters and digits from the original message will be included in the output. Additionally all whitespace will be stripped from the output and letters will be in uppercase.

```python
>>> receive("HOTEL ECHO LIMA LIMA OSCAR WHISKEY OSCAR ROMEO LIMA DELTA")
"HELLOWORLD"

>>> receive("NOVEMBER CHARLIE CHARLIE ONE SEVEN ZERO ONE DELTA")
"NCC1701D
```

To try and improve the security of the system, a [simple shift cipher][caesar] is suggested that shifts each NATO code word entry three places to the left. For example, `ECHO` becomes `BRAVO` and `SIX` becomes `THREE`.

Your job is to add functions named `transmit_encoded` and `receive_encoded`, which are similar to the `transmit` and `receive` functions, but with the aforementioned shift cipher applied to it:

```python
>>> transmit_encoded("Hello, World!")
"ECHO BRAVO INDIA INDIA LIMA TANGO LIMA OSCAR INDIA ALFA"

>>> receive_encoded("KILO NINER NINER YANKEE FOUR XRAY YANKEE ALFA")
"NCC1701D
```

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using:

```python
print("Debug message")
```

[str]: https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str
[ascii]: https://en.wikipedia.org/wiki/ASCII
[nato]: https://en.wikipedia.org/wiki/NATO_phonetic_alphabet#
[caesar]: https://en.wikipedia.org/wiki/Caesar_cipher
