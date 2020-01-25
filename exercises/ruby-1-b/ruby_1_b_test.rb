require 'minitest/autorun'
require_relative 'ruby_1_b'

class LibraryTest < Minitest::Test
  def test_first_book_imported
    assert_includes Library.books.map(&:isbn), "9780191604928"
  end

  def test_last_book_imported
    assert_includes Library.books.map(&:isbn), "9780451524935"
  end

  def test_books_size_matches_records_count
    assert_equal IO.foreach("books.txt").count - 1, Library.books.size
  end

  def test_book_has_title
    assert_equal "The Adventures of Tom Sawyer", Library.books.first.title
  end

  def test_book_has_author
    assert_equal "Mark Twain", Library.books.first.author
  end

  def test_book_has_isbn
    assert_equal "9780191604928", Library.books.first.isbn
  end

  def test_book_has_published
    assert_equal "2007", Library.books.first.published
  end
end
