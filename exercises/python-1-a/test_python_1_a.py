"""
Tests for python-1-a exercise.
"""

import string

import pytest

from python_1_a import compress


def _decompress(compressed: bytes) -> str:
    packed, unpacked = bytearray(compressed), bytearray()
    while packed:
        unpacked.extend(packed.pop(0) * [packed.pop(0)])
    return unpacked.decode("utf-8")


STRINGS = [
    "a",
    "ab",
    "abbccc",
    "0",
    "01",
    "011222",
    "a0bb11ccc222",
    "a" + "b" * 255 + "c",
    "a" * 255 + "0" * 255 + "b" * 255,
    string.ascii_lowercase,
    string.ascii_uppercase,
    string.ascii_letters,
    string.digits,
    string.hexdigits,
    string.octdigits,
    string.punctuation,
    string.whitespace,
    string.printable,
    u"\N{GRINNING FACE}" * 10 + "a" + u"\N{CRYING FACE}" * 10,
]


@pytest.mark.parametrize("to_test", STRINGS)
def test_roundtrip(to_test):
    """
    Verify that the user-provded compress function can round trip succesfully.
    """
    assert _decompress(compress(to_test)) == to_test
