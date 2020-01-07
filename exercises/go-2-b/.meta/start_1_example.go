package go2b

const maxScore = 21

var cardValues = map[rune]int{
	'A': 11,
	'K': 10,
	'Q': 10,
	'J': 10,
	'X': 10,
	'9': 9,
	'8': 8,
	'7': 7,
	'6': 6,
	'5': 5,
	'4': 4,
	'3': 3,
	'2': 2,
}

// Determine if the player has a winning blackjack hand.
func PlayerWins(playerHand string, dealerHand string) bool {
	pScore := handScore(playerHand)
	dScore := handScore(dealerHand)

	pBlackjack := isBlackjack(playerHand)
	dBlackjack := isBlackjack(dealerHand)

	return pScore > dScore &&
		pScore <= maxScore ||
		dScore > maxScore ||
		pBlackjack && !dBlackjack
}

func handScore(hand string) int {
	var score int
	var aces int
	for _, card := range hand {
		score += cardValues[card]

		if card == 'A' {
			aces++
		}
	}

	for score > maxScore && aces > 0 {
		score -= 10
		aces--
	}

	return score
}

func isBlackjack(hand string) bool {
	return handScore(hand) == maxScore && len(hand) == 2
}
