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

func Describe(amount int) string {
	description := ""

	for _, cutoff := range cutoffs {
		if amount%cutoff.amount == 0 {
			if len(description) > 0 {
				description += " or "
			}

			description += fmt.Sprintf("%d %s", amount/cutoff.amount, cutoff.description)
		}
	}

	if len(description) > 0 {
		description += " or "
	}

	description += strconv.Itoa(amount)

	return description
}
