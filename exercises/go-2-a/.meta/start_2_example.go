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
	descriptions := make([]string, 0)

	for _, cutoff := range cutoffs {
		count := amount / cutoff.amount
		amount %= cutoff.amount

		if count > 0 {
			description := fmt.Sprintf("%d %s", count, cutoff.description)
			descriptions = append(descriptions, description)
		}
	}

	if amount > 0 {
		descriptions = append(descriptions, strconv.Itoa(amount))
	}

	description := ""

	for index, cutoffDescription := range descriptions {
		if index == 0 {
			description += cutoffDescription
		} else if index == len(descriptions)-1 {
			description += fmt.Sprintf(" and %s", cutoffDescription)
		} else {
			description += fmt.Sprintf(", %s", cutoffDescription)
		}
	}

	return description
}
