VOWELS = %w{a e i o u}
def word_with_most_vowels(sentence)
  words = sentence.split(" ")
  word_vowels = words.map do |word|
    [
      word,
      word.downcase.chars.select{|l|VOWELS.include?(l)}.count
    ]
  end
  word_vowels.sort_by {|w,c| -c}.first.first
end
