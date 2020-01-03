package go1a

import (
	"fmt"
	"strconv"
)

func Describe(amount int) string {
	var description string

	if amount%144 == 0 {
		description += fmt.Sprintf("%d gross", amount/144)
	}

	if amount%20 == 0 {
		if description != "" {
			description += " or "
		}

		description += fmt.Sprintf("%d score", amount/20)
	}

	if amount%12 == 0 {
		if description != "" {
			description += " or "
		}

		description += fmt.Sprintf("%d dozen", amount/12)
	}

	if description != "" {
		description += " or "
	}

	description += strconv.Itoa(amount)

	return description
}
