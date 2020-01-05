package go2a

import (
	"fmt"
	"strconv"
)

// Describe takes an amount and returns a description
func Describe(amount int) string {
	var description string

	if amount%144 == 0 {
		description = concat(description, fmt.Sprintf("%d gross", amount/144))
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

func concat(description string, str string) string {
	if description == "" {
		return str
	}

	return description + " or " + str
}
