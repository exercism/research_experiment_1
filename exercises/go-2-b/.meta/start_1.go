package go2b

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

func HandScore(hand string) int {
	score := 0

	for _, card := range hand {
		score += cardValues[card]
	}

	return score
}

// Determine if the player has a winning blackjack hand.
func PlayerWins(playerHand string, dealerHand string) bool {
	playerHandScore := HandScore(playerHand)
	dealerHandScore := HandScore(dealerHand)

	if playerHandScore > MaximumHandScore {
		return false
	}

	if dealerHandScore > MaximumHandScore {
		return true
	}

	return playerHandScore > dealerHandScore
}
