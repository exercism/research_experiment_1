package go1b

import "testing"

func TestNumericWin(t *testing.T) {
	AssertPlayerWins(t, "279", "368", true)
}

func TestBlackjackWin(t *testing.T) {
	AssertPlayerWins(t, "JA", "J8", true)
}

func TestDrawLoss(t *testing.T) {
	AssertPlayerWins(t, "27Q", "K9", false)
}

func TestBustLoss(t *testing.T) {
	AssertPlayerWins(t, "K67", "J8", false)
}

func TestBustWin(t *testing.T) {
	AssertPlayerWins(t, "8432", "J8K", true)
}

func TestAceAsElevenWin(t *testing.T) {
	AssertPlayerWins(t, "7A", "K7", true)
}

func AssertPlayerWins(t *testing.T, playerHand string, dealerHand string, expected bool) {
	actual := PlayerWins(playerHand, dealerHand)
	if actual != expected {
		t.Errorf("PlayerWins(%q, %q)\n   got: %t\n  want: %t.", playerHand, dealerHand, actual, expected)
	}
}
