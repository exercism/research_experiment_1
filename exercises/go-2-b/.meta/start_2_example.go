package go2b

const maxScore = 21

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

func (h Hand) score() int {
	var score int
	var aces int
	for _, card := range h.cards {
		score += int(card)

		if card == Ace {
			aces++
		}
	}

	for score > maxScore && aces > 0 {
		score -= 10
		aces--
	}

	return score
}

func (h Hand) isBlackjack() bool {
	return len(h.cards) == 2 && h.score() == maxScore
}

// Determine if the player has a winning blackjack hand.
func PlayerWins(playerHand string, dealerHand string) bool {
	pHand := parseHand(playerHand)
	dHand := parseHand(dealerHand)

	return pHand.score() > dHand.score() &&
		pHand.score() <= maxScore ||
		dHand.score() > maxScore ||
		pHand.isBlackjack() && !dHand.isBlackjack()
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
