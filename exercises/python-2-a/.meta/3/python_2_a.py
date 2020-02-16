"""
Perform Run Length Encoding compression on a string.
"""
import re

def compress(raw: str) -> bytes:
    """
    Compress the raw string to bytes using RLE.
    """
    def repl(match):
        return bytes([len(match.group(0))]) + match.group(1)

    return re.sub(rb"(.)\1*", repl, raw.encode("utf-8"), flags=re.DOTALL)

def decompress(compressed: bytes) -> str:
    """
    Decompress RLE-encoded bytes back to UTF-8 text.
    """
    pass  # <- implement your function
