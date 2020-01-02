package go1a

import "testing"

func TestTwelve(t *testing.T) {
	AssertDescribe(t, 12, "1 dozen or 12")
}

func TestTwenty(t *testing.T) {
	AssertDescribe(t, 20, "1 score or 20")
}

func TestOneHundredFourtyFour(t *testing.T) {
	AssertDescribe(t, 144, "1 gross or 12 dozen or 144")
}

func TestOne(t *testing.T) {
	AssertDescribe(t, 1, "1")
}

func TestFourty(t *testing.T) {
	AssertDescribe(t, 40, "2 score or 40")
}

func TestSeventyTwo(t *testing.T) {
	AssertDescribe(t, 72, "6 dozen or 72")
}

func TestTwoHundredEightyEight(t *testing.T) {
	AssertDescribe(t, 288, "2 gross or 24 dozen or 288")
}

func TestSixtyFive(t *testing.T) {
	AssertDescribe(t, 65, "65")
}

func AssertDescribe(t *testing.T, input int, expected string) {
	actual := Describe(input)
	if actual != expected {
		t.Errorf("Describe(%d) = %q, expected %q.", input, actual, expected)
	}
}
