# Readme

## Instructions

Your task is to compress a UTF-8 [`str`][str] to [`bytes`][bytes] using [Run Length Encoding (RLE)][rle], a relatively straightforward compression scheme that takes any continuous run of 1 or more of the same byte and compresses it into two bytes, the first being the length of the run and the second being the byte itself.

We expect you to define a function `compress` that takes a single argument which is a UTF-8 `str` and returns a single even-length `bytes` value. Since individual UTF-8 characters can be more than one byte long you should encode the `str` to `bytes` _before_ applying the RLE compression. For the purposes of this task you can assume that no run will ever be more than 255 bytes long, so no run will ever require more than one byte to encode.

For example:

```python
>>> compress("abbcccddddaaaaaa")
b'\x01a\x02b\x03c\x04d\x06a'
```

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using:

```python
print("Debug message")
```

[str]: https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str
[bytes]: https://docs.python.org/3/library/stdtypes.html#binary-sequence-types-bytes-bytearray-memoryview
[rle]: https://en.wikipedia.org/wiki/Run-length_encoding
