require 'minitest/autorun'
require_relative 'ruby_1_a'

# Common test data version: 1.2.0 4fc1acb
class SentenceTest < Minitest::Test
  def test_one_word_with_one_vowel
    assert_equal "a", word_with_most_vowels("a")
  end

  def test_one_word_with_one_vowel_and_one_consonant
    assert_equal "at", word_with_most_vowels("at")
  end

  def test_one_word_with_two_vowels_and_one_consonant
    assert_equal "tea", word_with_most_vowels("tea")
  end

  def test_longest_word_is_not_word_with_most_vowels
    assert_equal "area", word_with_most_vowels("the area of a circle")
  end

  def test_last_word_is_word_with_most_vowels
    assert_equal "vegetables", word_with_most_vowels("extremely fresh vegetables")
  end

  def test_mixed_casing
    assert_equal "YOUR", word_with_most_vowels("TEST YOUR MIGHT")
  end

  def test_ignore_word_without_vowels
    assert_equal "great", word_with_most_vowels("great rhythm")
  end
end
