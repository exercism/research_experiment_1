"""
Perform RLE compression using imperative programming techniques.
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
    packed, unpacked = bytearray(compressed), bytearray()
    while packed:
        unpacked.extend(packed.pop(0) * [packed.pop(0)])
    return unpacked.decode("utf-8")
