"""
Conversion functions for the NATO Phonetic Alphabet.
"""

import re

# To save a lot of typing the code words are presented here
# as a dict, but feel free to change this if you'd like.
ALPHANUM_TO_NATO = {
    "A": "ALFA",
    "B": "BRAVO",
    "C": "CHARLIE",
    "D": "DELTA",
    "E": "ECHO",
    "F": "FOXTROT",
    "G": "GOLF",
    "H": "HOTEL",
    "I": "INDIA",
    "J": "JULIETT",
    "K": "KILO",
    "L": "LIMA",
    "M": "MIKE",
    "N": "NOVEMBER",
    "O": "OSCAR",
    "P": "PAPA",
    "Q": "QUEBEC",
    "R": "ROMEO",
    "S": "SIERRA",
    "T": "TANGO",
    "U": "UNIFORM",
    "V": "VICTOR",
    "W": "WHISKEY",
    "X": "XRAY",
    "Y": "YANKEE",
    "Z": "ZULU",
    "0": "ZERO",
    "1": "ONE",
    "2": "TWO",
    "3": "TREE",
    "4": "FOUR",
    "5": "FIVE",
    "6": "SIX",
    "7": "SEVEN",
    "8": "EIGHT",
    "9": "NINER",
}

NATO_TO_ALPHANUM = {v: k for k, v in ALPHANUM_TO_NATO.items()}

ALPHANUM_RE = re.compile(r"[{}]".format("".join(ALPHANUM_TO_NATO.keys())))
NATO_RE = re.compile(r"{0}".format("|".join(ALPHANUM_TO_NATO.values())))


def transmit(message: str) -> str:
    """
    Convert a message to a NATO code word transmission.
    """
    result = []
    for char in ALPHANUM_RE.findall(message.upper()):
        result.append(ALPHANUM_TO_NATO[char])
    return " ".join(result)


def receive(transmission: str) -> str:
    """
    Convert a NATO code word transmission to a message.
    """
    pattern = r"{0}".format("|".join(ALPHANUM_TO_NATO.values()))
    result = []
    for word in NATO_RE.findall(transmission):
        result.append(NATO_TO_ALPHANUM[word])
    return "".join(result)

def transmit_encoded(plaintext: str) -> str:
    """
    Encode a message and transmit as NATO code words.
    """
    pass  # <- implement your functio

def receive_encoded(ciphertext: str) -> str:
    """
    Receive an encoded message via NATO code word transmission.
    """
    pass  # <- implement your functio
