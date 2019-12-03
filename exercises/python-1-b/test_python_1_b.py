"""
Tests for python-1-b exercise.
"""

import pytest

from python_1_b import transmit, receive


DATA = [
    ("", "", ""),
    ("Hello!", "HOTEL ECHO LIMA LIMA OSCAR", "HELLO"),
    ("NCC-1701-D", "NOVEMBER CHARLIE CHARLIE ONE SEVEN ZERO ONE DELTA", "NCC1701D"),
    ("1,2-3|4", "ONE TWO TREE FOUR", "1234"),
    ("1am s0 l33t!", "ONE ALFA MIKE SIERRA ZERO LIMA TREE TREE TANGO", "1AMS0L33T"),
    (u"\N{GRINNING FACE} rofl", "ROMEO OSCAR FOXTROT LIMA", "ROFL"),
]


@pytest.mark.parametrize("message,transmission,_", DATA)
def test_transmit(message, transmission, _):
    """
    Verify the transmit-side conversion.
    """
    assert transmit(message) == transmission


@pytest.mark.parametrize("_,transmission,message", DATA)
def test_receive(_, transmission, message):
    """
    Verify the receive-side conversion.
    """
    assert receive(transmission) == message
