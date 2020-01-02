package go1b

const MaximumHandScore = 21

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

func ParseCard(card rune) Card {
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
	case '2':
		return Two
	}

	return Two
}

func ParseHand(hand string) Hand {
	cards := make([]Card, 0)

	for _, card := range hand {
		cards = append(cards, ParseCard(card))
	}

	return Hand{cards: cards}
}

func HandScore(hand string) int {
	parsedHand := ParseHand(hand)

	value := 0

	for _, card := range parsedHand.cards {
		value += int(card)
	}

	return value
}

func PlayerWins(playerHand string, dealerHand string) bool {
	return HandScore(playerHand) > HandScore(dealerHand) &&
		HandScore(playerHand) <= MaximumHandScore ||
		HandScore(dealerHand) > MaximumHandScore
}
