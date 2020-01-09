package go1b

const maxScore = 21

// PlayerWins determines if the player has a winning blackjack hand.
func PlayerWins(playerHand string, dealerHand string) bool {
	pScore := handScore(playerHand)
	dScore := handScore(dealerHand)

	return pScore > dScore &&
		pScore <= maxScore ||
		dScore > maxScore
}

func cardValue(card rune) int {
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

func handScore(hand string) int {
	var score int
	for _, card := range hand {
		score += cardValue(card)
	}

	return score
}
