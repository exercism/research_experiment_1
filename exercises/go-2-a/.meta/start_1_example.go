package go2a

import (
	"fmt"
	"strconv"
)

func Describe(amount int) string {
	var description string

	gross := amount / 144
	amount %= 144

	score := amount / 20
	amount %= 20

	dozen := amount / 12
	amount %= 12

	if gross > 0 {
		description += fmt.Sprintf("%d gross", gross)
	}

	if score > 0 {
		if description != "" && dozen+amount > 0 {
			description += ", "
		} else if description != "" {
			description += " and "
		}

		description += fmt.Sprintf("%d score", score)
	}

	if dozen > 0 {
		if description != "" && amount > 0 {
			description += ", "
		} else if description != "" {
			description += " and "
		}

		description += fmt.Sprintf("%d dozen", dozen)
	}

	if amount > 0 {
		if description != "" {
			description += " and "
		}

		description += strconv.Itoa(amount)
	}

	return description
}
