package go2a

import "testing"

func TestTwelve(t *testing.T) {
	AssertDescribe(t, 12, "1 dozen")
}

func TestTwenty(t *testing.T) {
	AssertDescribe(t, 20, "1 score")
}

func TestOneHundredFourtyFour(t *testing.T) {
	AssertDescribe(t, 144, "1 gross")
}

func TestOne(t *testing.T) {
	AssertDescribe(t, 1, "1")
}

func TestFourty(t *testing.T) {
	AssertDescribe(t, 40, "2 score")
}

func TestSeventyTwo(t *testing.T) {
	AssertDescribe(t, 72, "3 score and 1 dozen")
}

func TestTwoHundredEightyEight(t *testing.T) {
	AssertDescribe(t, 288, "2 gross")
}

func TestSixtyFive(t *testing.T) {
	AssertDescribe(t, 65, "3 score and 5")
}

func TestThreeHunderedAndFourtyFive(t *testing.T) {
	AssertDescribe(t, 345, "2 gross, 2 score, 1 dozen and 5")
}

func AssertDescribe(t *testing.T, input int, expected string) {
	actual := Describe(input)
	if actual != expected {
		t.Errorf("Describe(%d)\n   got: %q\n  want: %q.", input, actual, expected)
	}
}
