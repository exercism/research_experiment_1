package go1b

const MaxScore = 21

type Card int

const (
	Ace   Card = 11
	King       = 10
	Queen      = 10
	Jack       = 10
	Ten        = 10
	Nine       = 9
	Eight      = 8
	Seven      = 7
	Six        = 6
	Five       = 5
	Four       = 4
	Three      = 3
	Two        = 2
)

type Hand struct {
	cards []Card
}

// Determine if the player has a winning blackjack hand.
func PlayerWins(playerHand string, dealerHand string) bool {
	return handScore(playerHand) > handScore(dealerHand) &&
		handScore(playerHand) <= MaxScore ||
		handScore(dealerHand) > MaxScore
}

func parseCard(card rune) Card {
	switch card {
	case 'A':
		return Ace
	case 'K':
		return King
	case 'Q':
		return Queen
	case 'J':
		return Jack
	case 'X':
		return Ten
	case '9':
		return Nine
	case '8':
		return Eight
	case '7':
		return Seven
	case '6':
		return Six
	case '5':
		return Five
	case '4':
		return Four
	case '3':
		return Three
	}

	return Two
}

func parseHand(hand string) Hand {
	var cards []Card

	for _, card := range hand {
		cards = append(cards, parseCard(card))
	}

	return Hand{cards: cards}
}

func handScore(hand string) int {
	parsedHand := parseHand(hand)

	var score int

	for _, card := range parsedHand.cards {
		score += int(card)
	}

	return score
}
