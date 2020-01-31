"""
Tests for python-1-b exercise.
"""
import unittest
import string

from python_1_b import transmit, receive


class TestTransmit(unittest.TestCase):
    def assertCanTransmit(self, string, expect, slug):
        # format the command for display
        short = string if len(string) <= 10 else string[:6] + "[...]"
        cmd = f"transmit({short!r})"

        nato = transmit(string)
        self.assertIsNotNone(nato, msg=f"{cmd} should return a value")
        self.assertIsInstance(nato, str, msg=f"{cmd} should return str")
        self.assertEqual(nato, expect, msg=f"{cmd} must handle {slug}")

    def test_empty_string(self):
        self.assertCanTransmit("", "", "the empty string")

    def test_hello_world(self):
        text = "Hello, World!"
        expect = "HOTEL ECHO LIMA LIMA OSCAR WHISKEY OSCAR ROMEO LIMA DELTA"
        self.assertCanTransmit(text, expect, "mixed case and ASCII punctuation")

    def test_enterprise(self):
        text = "NCC-1701-D"
        expect = "NOVEMBER CHARLIE CHARLIE ONE SEVEN ZERO ONE DELTA"
        self.assertCanTransmit(text, expect, "a ship's registry number")

    def test_only_ascii_alphanum(self):
        text = (
            "\N{GREEK CAPITAL LETTER NU}\N{CHEROKEE LETTER TLI}\N{CHEROKEE LETTER TLI}-1701-\N{CHEROKEE LETTER A}"
            + string.whitespace
            + string.punctuation
        )
        expect = "ONE SEVEN ZERO ONE"
        self.assertCanTransmit(text, expect, "non-ASCII and non-alphanumeric chars")


class TestReceive(unittest.TestCase):
    def assertCanReceive(self, string, expect, slug):
        # format the command for display
        short = string if len(string) <= 10 else string[:6] + "[...]"
        cmd = f"receive({short!r})"

        message = receive(string)
        self.assertIsNotNone(message, msg=f"{cmd} should return a value")
        self.assertIsInstance(message, str, msg=f"{cmd} should return str")
        self.assertEqual(message, expect, msg=f"{cmd} must handle {slug}")

    def test_empty_string(self):
        self.assertCanReceive("", "", "the empty string")

    def test_hello_world(self):
        text = "HOTEL ECHO LIMA LIMA OSCAR WHISKEY OSCAR ROMEO LIMA DELTA"
        expect = "HELLOWORLD"
        self.assertCanReceive(text, expect, "letters only")

    def test_enterprise(self):
        text = "NOVEMBER CHARLIE CHARLIE ONE SEVEN ZERO ONE DELTA"
        expect = "NCC1701D"
        self.assertCanReceive(text, expect, "letters and digits")


if __name__ == "__main__":
    unittest.main()
