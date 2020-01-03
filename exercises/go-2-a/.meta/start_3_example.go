package go2a

import (
	"fmt"
	"regexp"
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

var matchLastCommaRegex = regexp.MustCompile(`(.*), (.+?)$`)

func replaceLastCommaWithAnd(description string) string {
	return matchLastCommaRegex.ReplaceAllString(description, "$1 and $2")
}

func appendToDescription(description *strings.Builder, str string) {
	if description.Len() != 0 {
		description.WriteString(", ")
	}

	description.WriteString(str)
}

func Describe(amount int) string {
	var description = &strings.Builder{}

	for _, cutoff := range cutoffs {
		count := amount / cutoff.amount
		amount %= cutoff.amount

		if count > 0 {
			appendToDescription(description, fmt.Sprintf("%d %s", count, cutoff.description))
		}
	}

	if amount > 0 {
		appendToDescription(description, strconv.Itoa(amount))
	}

	return replaceLastCommaWithAnd(description.String())
}
