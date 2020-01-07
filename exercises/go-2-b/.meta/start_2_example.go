package go2b

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

func IsBlackjack(hand Hand) bool {
	return len(hand.cards) == 2 && HandScore(hand) == MaximumHandScore
}

func HandScore(hand Hand) int {
	score := 0
	aces := 0

	for _, card := range hand.cards {
		score += int(card)

		if card == Ace {
			aces++
		}
	}

	for score > MaximumHandScore && aces > 0 {
		score -= 10
		aces--
	}

	return score
}

// Determine if the player has a winning blackjack hand.
func PlayerWins(playerHand string, dealerHand string) bool {
	parsedPlayerHand := ParseHand(playerHand)
	parsedDealerHand := ParseHand(dealerHand)

	return HandScore(parsedPlayerHand) > HandScore(parsedDealerHand) &&
		HandScore(parsedPlayerHand) <= MaximumHandScore ||
		HandScore(parsedDealerHand) > MaximumHandScore ||
		IsBlackjack(parsedPlayerHand) && !IsBlackjack(parsedDealerHand)
}
