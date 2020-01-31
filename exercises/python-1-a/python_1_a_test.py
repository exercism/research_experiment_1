"""
Tests for python-1-a exercise.
"""
import unittest
import string
from itertools import chain

from python_1_a import compress


def _decompress(compressed: bytes) -> str:
    packed, unpacked = bytearray(compressed), bytearray()
    while packed:
        unpacked.extend(packed.pop(0) * [packed.pop(0)])
    return unpacked.decode("utf-8")


class TestCompress(unittest.TestCase):
    def assertCanCompress(self, string, expect, slug):
        # format the command for display
        short = string if len(string) <= 10 else string[:6] + "[...]"
        cmd = f"compress({short!r})"

        packed = compress(string)
        self.assertIsNotNone(packed, msg=f"{cmd} should return a value")
        self.assertIsInstance(packed, bytes, msg=f"{cmd} should return bytes")
        self.assertEqual(packed, expect, msg=f"{cmd} must handle {slug}")
        unpacked = _decompress(packed)
        self.assertEqual(string, unpacked, msg=f"{cmd} must round trip")

    def test_empty_string(self):
        self.assertCanCompress("", b"", "the empty string")

    def test_single_ascii_letter(self):
        self.assertCanCompress("a", b"\x01a", "a single ASCII letter")

    def test_unique_ascii_letters(self):
        self.assertCanCompress("ab", b"\x01a\x01b", "unique ASCII letters")

    def test_duplicated_ascii_letters(self):
        text = "abbccc"
        expect = b"\x01a\x02b\x03c"
        self.assertCanCompress(text, expect, "duplicated ASCII letters")

    def test_single_ascii_digit(self):
        self.assertCanCompress("0", b"\x010", "a single ASCII digit")

    def test_unique_ascii_digits(self):
        self.assertCanCompress("01", b"\x010\x011", "unique ASCII digits")

    def test_duplicated_ascii_digits(self):
        text = "011222"
        expect = b"\x010\x021\x032"
        self.assertCanCompress(text, expect, "duplicated ASCII digits")

    def test_mixed_ascii_alphanum(self):
        text = "a0bb11ccc222"
        expect = b"\x01a\x010\x02b\x021\x03c\x032"
        self.assertCanCompress(text, expect, "mixed ascii alphanumerics")

    def test_very_long_run(self):
        text = "a" + "b" * 255 + "c"
        expect = b"\x01a\xffb\x01c"
        self.assertCanCompress(text, expect, "a very long run")

    def test_very_long_runs(self):
        text = "a" * 255 + "0" * 255 + "b" * 255
        expect = b"\xffa\xff0\xffb"
        self.assertCanCompress(text, expect, "very long runs")

    def test_all_ascii_letters(self):
        text = string.ascii_letters
        expect = bytes(chain.from_iterable((1, ord(c)) for c in text))
        self.assertCanCompress(text, expect, "all ASCII letters")

    def test_all_ascii_digits(self):
        text = string.digits
        expect = bytes(chain.from_iterable((1, ord(c)) for c in text))
        self.assertCanCompress(text, expect, "all ASCII digits")

    def test_all_ascii_punctuation(self):
        text = string.punctuation
        expect = bytes(chain.from_iterable((1, ord(c)) for c in text))
        self.assertCanCompress(text, expect, "all ASCII punctuation")

    def test_all_ascii_whitespace(self):
        text = string.whitespace
        expect = bytes(chain.from_iterable((1, ord(c)) for c in text))
        self.assertCanCompress(text, expect, "all ASCII whitespace")

    def test_all_ascii_printable(self):
        text = string.printable
        expect = bytes(chain.from_iterable((1, ord(c)) for c in text))
        self.assertCanCompress(text, expect, "all printable ASCII chars")

    def test_multibyte_unicode(self):
        text = "\N{GRINNING FACE} \N{SHAMROCK}"
        expect = b"\x01\xf0\x01\x9f\x01\x98\x01\x80\x01 \x01\xe2\x02\x98"
        self.assertCanCompress(text, expect, "multibyte Unicode chars")


if __name__ == "__main__":
    unittest.main()
