package go1a

import (
	"fmt"
	"strconv"
	"strings"
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
	var descriptions []string

	for _, cutoff := range cutoffs {
		if amount%cutoff.amount == 0 {
			description := fmt.Sprintf("%d %s", amount/cutoff.amount, cutoff.description)
			descriptions = append(descriptions, description)
		}
	}

	descriptions = append(descriptions, strconv.Itoa(amount))

	return strings.Join(descriptions, " or ")
}
