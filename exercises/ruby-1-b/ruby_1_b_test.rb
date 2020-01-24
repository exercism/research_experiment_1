require 'minitest/autorun'
require_relative 'ruby_1_b'

class LibraryTest < Minitest::Test
  def test_first_book_imported
    assert Library.books.map(&:isbn).include?("9780191604928")
  end

  def test_last_book_imported
    assert Library.books.map(&:isbn).include?("9780451524935")
  end

  def test_books_size_matches_records_count
    assert Library.books.size == File.foreach("books.txt").count - 1
  end

  def test_book_has_title
    assert Library.books.first.title == "The Adventures of Tom Sawyer"
  end

  def test_book_has_author
    assert Library.books.first.author == "Mark Twain"
  end

  def test_book_has_isbn
    assert Library.books.first.isbn == "9780191604928"
  end

  def test_book_has_published
    assert Library.books.first.published == "2007"
  end
end
