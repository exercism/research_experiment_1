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

func Describe(amount int) string {
	var description string

	for _, cutoff := range cutoffs {
		count := amount / cutoff.amount
		amount %= cutoff.amount

		if count > 0 {
			if description != "" {
				description += ", "
			}

			description += fmt.Sprintf("%d %s", count, cutoff.description)
		}
	}

	if amount > 0 {
		if description != "" {
			description += ", "
		}

		description += strconv.Itoa(amount)
	}

	re := regexp.MustCompile(`(.*), (.+?)$`)
	return re.ReplaceAllString(description, "$1 and $2")
}
