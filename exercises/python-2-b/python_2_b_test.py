"""
Tests for python-2-b exercise.
"""
import unittest
import string

from python_2_b import transmit, transmit_encoded, receive, receive_encoded

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


class TestTransmitEncoded(unittest.TestCase):
    def assertCanTransmitEncoded(self, string, expect, slug):
        # format the command for display
        short = string if len(string) <= 10 else string[:6] + "[...]"
        cmd = f"transmit_encoded({short!r})"

        nato = transmit_encoded(string)
        self.assertIsNotNone(nato, msg=f"{cmd} should return a value")
        self.assertIsInstance(nato, str, msg=f"{cmd} should return str")
        self.assertEqual(nato, expect, msg=f"{cmd} must handle {slug}")

    def test_empty_string(self):
        self.assertCanTransmitEncoded("", "", "the empty string")

    def test_hello_world(self):
        text = "Hello, World!"
        expect = "ECHO BRAVO INDIA INDIA LIMA TANGO LIMA OSCAR INDIA ALFA"
        self.assertCanTransmitEncoded(text, expect, "mixed case and ASCII punctuation")

    def test_enterprise(self):
        text = "NCC-1701-D"
        expect = "KILO NINER NINER YANKEE FOUR XRAY YANKEE ALFA"
        self.assertCanTransmitEncoded(text, expect, "a ship's registry number")

    def test_only_ascii_alphanum(self):
        text = (
            "\N{GREEK CAPITAL LETTER NU}\N{CHEROKEE LETTER TLI}\N{CHEROKEE LETTER TLI}-1701-\N{CHEROKEE LETTER A}"
            + string.whitespace
            + string.punctuation
        )
        expect = "YANKEE FOUR XRAY YANKEE"
        self.assertCanTransmitEncoded(text, expect, "non-ASCII and non-alphanumeric chars")


class TestReceiveEncoded(unittest.TestCase):
    def assertCanReceiveEncoded(self, string, expect, slug):
        # format the command for display
        short = string if len(string) <= 10 else string[:6] + "[...]"
        cmd = f"receive_encoded({short!r})"

        message = receive_encoded(string)
        self.assertIsNotNone(message, msg=f"{cmd} should return a value")
        self.assertIsInstance(message, str, msg=f"{cmd} should return str")
        self.assertEqual(message, expect, msg=f"{cmd} must handle {slug}")

    def test_empty_string(self):
        self.assertCanReceiveEncoded("", "", "the empty string")

    def test_hello_world(self):
        text = "ECHO BRAVO INDIA INDIA LIMA TANGO LIMA OSCAR INDIA ALFA"
        expect = "HELLOWORLD"
        self.assertCanReceiveEncoded(text, expect, "letters only")

    def test_enterprise(self):
        text = "KILO NINER NINER YANKEE FOUR XRAY YANKEE ALFA"
        expect = "NCC1701D"
        self.assertCanReceiveEncoded(text, expect, "letters and digits")


if __name__ == "__main__":
    unittest.main()

