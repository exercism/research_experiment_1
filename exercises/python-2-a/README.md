# Introduction

This is Part 2 of our research into how people write Python differently. This exercise should take 10-15 minutes for a programmer who is proficient in Python. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

# Instructions

Your task is to extend existing code with new functionality. The existing code can compress a UTF-8 [`str`][str] to [`bytes`][bytes] using [Run Length Encoding (RLE)][rle], which a relatively straightforward compression scheme that takes any continuous run of 1 or more of the same byte and compresses it into two bytes, the first being the length of the run and the second being the byte itself.

The code you'll be working with has a function named `compress` that takes a single argument which is a UTF-8 `str` and returns a single even-length `bytes` value. Since individual UTF-8 characters can be more than one byte long you should encode the `str` to `bytes` _before_ applying the RLE compression. For the purposes of this task you can assume that no run will ever be more than 255 bytes long, so no run will ever require more than one byte to encode.

For example:

```python
>>> compress("abbcccddddaaaaaa")
b'\x01a\x02b\x03c\x04d\x0
```

Besides compressing values, each compression scheme should also support decompressing these compressed values back to their original value. Your job is to add a function named `decompress` that can decompress the compressed `bytes` value to its original UTF-8 `str`:

```python
>>> decompress(b'\x01a\x02b\x03c\x04d\x0)
"abbcccddddaaaaaa"
```

[str]: https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str
[bytes]: https://docs.python.org/3/library/stdtypes.html#binary-sequence-types-bytes-bytearray-memoryview
[rle]: https://en.wikipedia.org/wiki/Run-length_encoding
