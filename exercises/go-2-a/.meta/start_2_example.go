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

// Describe takes an amount and returns a description.
func Describe(amount int) string {
	var descriptions []string
	for _, cutoff := range cutoffs {
		count := amount / cutoff.amount
		amount %= cutoff.amount

		if count > 0 {
			desc := fmt.Sprintf("%d %s", count, cutoff.description)
			descriptions = append(descriptions, desc)
		}
	}

	if amount > 0 {
		descriptions = append(descriptions, strconv.Itoa(amount))
	}

	var description string

	for i, cutoffDesc := range descriptions {
		description = appendDesc(description, i == 0, i == len(descriptions)-1, cutoffDesc)
	}

	return description
}

func appendDesc(description string, first bool, last bool, cutoffDescription string) string {
	if first {
		return cutoffDescription
	}

	if last {
		return fmt.Sprintf("%s and %s", description, cutoffDescription)
	}

	return fmt.Sprintf("%s, %s", description, cutoffDescription)
}
