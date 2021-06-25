"""
Conversion functions for the NATO Phonetic Alphabet.
"""

from enum import Enum

# To save a lot of typing the code words are presented here
# as an enum, but feel free to change this if you'd like.
class CodeWords(Enum):
    ALFA = "A"
    BRAVO = "B"
    CHARLIE = "C"
    DELTA = "D"
    ECHO = "E"
    FOXTROT = "F"
    GOLF = "G"
    HOTEL = "H"
    INDIA = "I"
    JULIETT = "J"
    KILO = "K"
    LIMA = "L"
    MIKE = "M"
    NOVEMBER = "N"
    OSCAR = "O"
    PAPA = "P"
    QUEBEC = "Q"
    ROMEO = "R"
    SIERRA = "S"
    TANGO = "T"
    UNIFORM = "U"
    VICTOR = "V"
    WHISKEY = "W"
    XRAY = "X"
    YANKEE = "Y"
    ZULU = "Z"
    ZERO = "0"
    ONE = "1"
    TWO = "2"
    TREE = "3"
    FOUR = "4"
    FIVE = "5"
    SIX = "6"
    SEVEN = "7"
    EIGHT = "8"
    NINER = "9"


def transmit(message: str) -> str:
    """
    Convert a message to a NATO code word transmission.
    """
    encoded = []
    for char in message.upper():
        if char.isascii() and char.isalnum():
            encoded.append(CodeWords(char).name)
    return " ".join(encoded)

def receive(transmission: str) -> str:
    """
    Convert a NATO code word transmission to a message.
    """
    decoded = []
    for word in transmission.split():
        decoded.append(CodeWords[word].value)
    return "".join(decoded)

def transmit_encoded(plaintext: str) -> str:
    """
    Encode a message and transmit as NATO code words.
    """
    pass  # <- implement your function

def receive_encoded(ciphertext: str) -> str:
    """
    Receive an encoded message via NATO code word transmission.
    """
    pass  # <- implement your function
