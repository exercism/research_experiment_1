"""
Perform Run Length Encoding compression on a string.
"""

def compress(raw: str) -> bytes:
    """
    Compress the raw string to bytes using RLE.
    """
    packed = bytearray()
    for char in raw.encode("utf-8"):
        if not packed or char != packed[-1]:
            packed.extend([1, char])
        else:
            packed[-2] += 1
    return bytes(packed)


def decompress(compressed: bytes) -> str:
    """
    Decompress RLE-encoded bytes back to UTF-8 text.
    """
    pass  # <- implement your function
