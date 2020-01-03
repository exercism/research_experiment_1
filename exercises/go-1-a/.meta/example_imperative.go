package go1a

import (
	"fmt"
	"strconv"
)

func concat(description string, str string) string {
	if description != "" {
		return description + " or " + str
	}

	return description + str
}

func Describe(amount int) string {
	var description string

	if amount%144 == 0 {
		description += concat(description, fmt.Sprintf("%d gross", amount/144))
	}

	if amount%20 == 0 {
		description = concat(description, fmt.Sprintf("%d score", amount/20))
	}

	if amount%12 == 0 {
		description = concat(description, fmt.Sprintf("%d dozen", amount/12))
	}

	description = concat(description, strconv.Itoa(amount))

	return description
}
