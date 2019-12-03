# Introduction

This is Part 1 of our research into how people write Python differently.
This exercise should take 10-15 minutes.
There is no right or wrong way to approach it - just do what feels the most natural to you.
Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

# Instructions

Your task is to transmit a [`str`][str] comprised of [ASCII][ascii] characters in the [NATO Phonetic Alphabet][nato] and be able to read it back again. The Phonetic Alphabet is used in aviation, shipping, and military applications to allow clear, unambiguous communication of words over telephone and radio transmissions.

First, we expect you to define a function `transmit` that will take an arbitrary message and return it as a space-separated NATO code word transmission. Although punctuation and whitespace may be present in the orginal sentence only ASCII letters and digits need to be converted. The case of the letters is irrelevant, but the resulting transmission will be all upper case.

```python
>>> transmit("Hello!")
"HOTEL ECHO LIMA LIMA OSCAR"

>>> transmit("NCC-1701-D")
"NOVEMBER CHARLIE CHARLIE ONE SEVEN ZERO ONE DELTA"
```

Next, we expect you to define a function `receive` that will take a NATO code word transmission and convert it back to a readable message. Because the phonetic alphabet is a lossy transmission format whitespace will be missing, and to avoid ambiguity all letters will be in uppercase.

```python
>>> receive("HOTEL ECHO LIMA LIMA OSCAR")
"HELLO"

>>> receive("NOVEMBER CHARLIE CHARLIE ONE SEVEN ZERO ONE DELTA")
"NCC1701D
```

[str]: https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str
[ascii]: https://en.wikipedia.org/wiki/ASCII
[nato]: https://en.wikipedia.org/wiki/NATO_phonetic_alphabet#
