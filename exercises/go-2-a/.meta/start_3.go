package go2a

import (
	"fmt"
	"strconv"
)

var cutoffs = []struct {
	amount      int
	description string
}{
	{144, "gross"},
	{20, "score"},
	{12, "dozen"},
}

func concat(description string, str string) string {
	if description != "" {
		return description + " or " + str
	}

	return description + str
}

func Describe(amount int) string {
	var description string

	for _, cutoff := range cutoffs {
		if amount%cutoff.amount == 0 {
			description = concat(description, fmt.Sprintf("%d %s", amount/cutoff.amount, cutoff.description))
		}
	}

	description = concat(description, strconv.Itoa(amount))

	return description
}
