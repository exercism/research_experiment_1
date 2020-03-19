## Instructions

Your task is to transmit a [`str`][str] comprised of [ASCII][ascii] characters in the [NATO Phonetic Alphabet][nato] and be able to read it back again. The Phonetic Alphabet is used in aviation, shipping, and military applications to allow clear, unambiguous communication of words over telephone and radio transmissions.

First, we expect you to define a function `transmit` that will take an arbitrary message and return it as a space-separated NATO code word transmission. Although punctuation and whitespace may be present in the orginal sentence only ASCII letters and digits need to be converted. The case of the letters is irrelevant, but the resulting transmission will be all upper case.

```python
>>> transmit("Hello, World!")
"HOTEL ECHO LIMA LIMA OSCAR WHISKEY OSCAR ROMEO LIMA DELTA"

>>> transmit("NCC-1701-D")
"NOVEMBER CHARLIE CHARLIE ONE SEVEN ZERO ONE DELTA"
```

Next, we expect you to define a function `receive` that will take a NATO code word transmission formatted as described above and convert it back to a readable message. Because the phonetic alphabet is a lossy transmission format only the letters and digits from the original message will be included in the output. Additionally all whitespace will be stripped from the output and letters will be in uppercase.

```python
>>> receive("HOTEL ECHO LIMA LIMA OSCAR WHISKEY OSCAR ROMEO LIMA DELTA")
"HELLOWORLD"

>>> receive("NOVEMBER CHARLIE CHARLIE ONE SEVEN ZERO ONE DELTA")
"NCC1701D
```

[str]: https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str
[ascii]: https://en.wikipedia.org/wiki/ASCII
[nato]: https://en.wikipedia.org/wiki/NATO_phonetic_alphabet#
