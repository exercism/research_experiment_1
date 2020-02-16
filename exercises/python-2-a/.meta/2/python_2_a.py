"""
Perform Run Length Encoding compression on a string.
"""

from itertools import chain, groupby


def compress(raw: str) -> bytes:
    """
    Compress the raw string to bytes using RLE.
    """

    def flipcount(group):
        char, run = group
        return len(list(run)), char

    return bytes(chain.from_iterable(map(flipcount, groupby(raw.encode("utf-8")))))


def decompress(compressed: bytes) -> str:
    """
    Decompress RLE-encoded bytes back to UTF-8 text.
    """
    pass  # <- implement your function
