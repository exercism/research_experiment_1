package go2a

import (
	"fmt"
	"regexp"
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

var matchLastCommaRegex = regexp.MustCompile(`(.*), (.+?)$`)

func concat(description string, str string) string {
	if description != "" {
		return description + ", " + str
	}

	return description + str
}

func Describe(amount int) string {
	var description string

	for _, cutoff := range cutoffs {
		count := amount / cutoff.amount
		amount %= cutoff.amount

		if count > 0 {
			description = concat(description, fmt.Sprintf("%d %s", count, cutoff.description))
		}
	}

	if amount > 0 {
		description = concat(description, strconv.Itoa(amount))
	}

	return matchLastCommaRegex.ReplaceAllString(description, "$1 and $2")
}
