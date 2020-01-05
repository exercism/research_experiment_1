package go2a

import (
	"fmt"
	"strconv"
)

// Describe takes an amount and returns a description
func Describe(amount int) string {
	var description string

	gross, score, dozen, remainder := split(amount)

	if gross > 0 {
		description = fmt.Sprintf("%d gross", gross)
	}

	if score > 0 {
		description = concat(description, fmt.Sprintf("%d score", score), dozen+remainder)
	}

	if dozen > 0 {
		description = concat(description, fmt.Sprintf("%d dozen", dozen), remainder)
	}

	if remainder > 0 {
		description = concat(description, strconv.Itoa(remainder), 0)
	}

	return description
}

func split(amount int) (gross int, score int, dozen int, rest int) {
	gross = amount / 144
	amount %= 144

	score = amount / 20
	amount %= 20

	return gross, score, amount / 12, amount % 12
}

func concat(description string, str string, remainder int) string {
	if description != "" && remainder > 0 {
		return description + ", " + str
	}

	if description != "" {
		return description + " and " + str
	}

	return str
}
