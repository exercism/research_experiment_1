package go2b

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

func TestBlackjackDrawWin(t *testing.T) {
	AssertPlayerWins(t, "AQ", "K92", true)
}

func TestBlackjackDrawLoss(t *testing.T) {
	AssertPlayerWins(t, "KA", "AX", false)
}

func TestAceAsOneWin(t *testing.T) {
	AssertPlayerWins(t, "89A", "97", true)
}

func TestAceAsOneAndAceAsElevenWin(t *testing.T) {
	AssertPlayerWins(t, "AA8", "Q9", true)
}

func AssertPlayerWins(t *testing.T, playerHand string, dealerHand string, expected bool) {
	actual := PlayerWins(playerHand, dealerHand)
	if actual != expected {
		t.Errorf("PlayerWins(%q, %q) = %t, expected %t.", playerHand, dealerHand, actual, expected)
	}
}
