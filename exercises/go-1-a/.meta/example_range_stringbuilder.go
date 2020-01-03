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

func appendToDescription(description *strings.Builder, str string) {
	if description.Len() != 0 {
		description.WriteString(" or ")
	}

	description.WriteString(str)
}

func Describe(amount int) string {
	var description = &strings.Builder{}

	for _, cutoff := range cutoffs {
		if amount%cutoff.amount == 0 {
			appendToDescription(description, fmt.Sprintf("%d %s", amount/cutoff.amount, cutoff.description))
		}
	}

	appendToDescription(description, strconv.Itoa(amount))

	return description.String()
}
