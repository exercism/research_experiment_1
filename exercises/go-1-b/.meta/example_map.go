package go1b

const MaximumHandScore = 21

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

	if pScore > MaximumHandScore {
		return false
	}

	if dScore > MaximumHandScore {
		return true
	}

	return pScore > dScore
}

func handScore(hand string) int {
	var score int
	for _, card := range hand {
		score += cardValues[card]
	}

	return score
}
