package go1b

const MaximumHandScore = 21

func CardValue(card rune) int {
	switch card {
	case 'A':
		return 11
	case 'K':
		return 10
	case 'Q':
		return 10
	case 'J':
		return 10
	case 'X':
		return 10
	}

	return int(card - '0')
}

func HandScore(hand string) int {
	score := 0

	for _, card := range hand {
		score += CardValue(card)
	}

	return score
}

// Determine if the player has a winning blackjack hand.
func PlayerWins(playerHand string, dealerHand string) bool {
	return HandScore(playerHand) > HandScore(dealerHand) &&
		HandScore(playerHand) <= MaximumHandScore ||
		HandScore(dealerHand) > MaximumHandScore
}
