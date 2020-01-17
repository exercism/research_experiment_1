package go2b

const maxScore = 21

type card int

const (
	ace   card = 11
	king  card = 10
	queen card = 10
	jack  card = 10
	ten   card = 10
	nine  card = 9
	eight card = 8
	seven card = 7
	six   card = 6
	five  card = 5
	four  card = 4
	three card = 3
	two   card = 2
)

type hand struct {
	cards []card
}

func (h hand) score() int {
	var score int
	var aces int
	for _, card := range h.cards {
		score += int(card)

		if card == ace {
			aces++
		}
	}

	for score > maxScore && aces > 0 {
		score -= 10
		aces--
	}

	return score
}

func (h hand) isBlackjack() bool {
	return len(h.cards) == 2 && h.score() == maxScore
}

// PlayerWins determines if the player has a winning blackjack hand.
func PlayerWins(playerHand string, dealerHand string) bool {
	pHand := parseHand(playerHand)
	dHand := parseHand(dealerHand)

	return pHand.score() > dHand.score() &&
		pHand.score() <= maxScore ||
		dHand.score() > maxScore ||
		pHand.isBlackjack() && !dHand.isBlackjack()
}

func parseCard(card rune) card {
	switch card {
	case 'A':
		return ace
	case 'K':
		return king
	case 'Q':
		return queen
	case 'J':
		return jack
	case 'X':
		return ten
	case '9':
		return nine
	case '8':
		return eight
	case '7':
		return seven
	case '6':
		return six
	case '5':
		return five
	case '4':
		return four
	case '3':
		return three
	}

	return two
}

func parseHand(h string) hand {
	var cards []card
	for _, card := range h {
		cards = append(cards, parseCard(card))
	}

	return hand{cards: cards}
}
