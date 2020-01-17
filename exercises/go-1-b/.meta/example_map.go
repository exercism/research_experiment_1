package go1b

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

// PlayerWins determines if the player has a winning blackjack hand.
func PlayerWins(playerHand string, dealerHand string) bool {
	pScore := handScore(playerHand)
	dScore := handScore(dealerHand)

	return pScore > dScore &&
		pScore <= maxScore ||
		dScore > maxScore
}

func handScore(hand string) int {
	var score int
	for _, card := range hand {
		score += cardValues[card]
	}

	return score
}
