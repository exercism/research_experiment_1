package go2b

const MaximumHandScore = 21

// Determine if the player has a winning blackjack hand.
func PlayerWins(playerHand string, dealerHand string) bool {
	pScore := handScore(playerHand)
	dScore := handScore(dealerHand)

	pBlackjack := isBlackjack(playerHand)
	dBlackjack := isBlackjack(dealerHand)

	return pScore > dScore &&
		pScore <= MaximumHandScore ||
		dScore > MaximumHandScore ||
		pBlackjack && !dBlackjack
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
	var aces int
	for _, card := range hand {
		score += cardValue(card)

		if card == 'A' {
			aces++
		}
	}

	for score > MaximumHandScore && aces > 0 {
		score -= 10
		aces--
	}

	return score
}

func isBlackjack(hand string) bool {
	return handScore(hand) == MaximumHandScore && len(hand) == 2
}
