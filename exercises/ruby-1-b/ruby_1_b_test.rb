require 'minitest/autorun'
require_relative 'ruby_1_b.rb'

class LibraryTest < Minitest::Test
  def setup
    @library = Library.new
  end

  def test_find_by_empty_isbn_returns_nil
    assert_nil @library.find("")
  end

  def test_find_by_isbn_without_corresponding_book
    assert_nil @library.find("123456789")
  end

  def test_find_first_book
    assert @library.find("9780191604928")
  end

  def test_find_last_book
    assert @library.find("9780451524935")
  end

  def test_book_has_title
    assert_equal "The Adventures of Tom Sawyer", @library.find("9780191604928").title
  end

  def test_book_has_author
    assert_equal "Plato", @library.find("9780718198916").author
  end

  def test_book_has_isbn
    assert_equal "9780974514055", @library.find("9780974514055").isbn
  end

  def test_book_has_published
    assert_equal "1988", @library.find("9780446310789").published
  end

  def test_add_copies_with_invalid_isbn_raises_argument_error
    assert_raises(ArgumentError) { @library.add_copies("123456789", count: 10) }
  end

  def test_add_copies_with_valid_isbn_returns_the_added_count
    assert_equal 10, @library.add_copies("9780544003415", count: 10)
  end

  def test_borrowing_when_there_are_no_copies_returns_nil
    assert_nil @library.borrow("9780544003415")
  end

  def test_borrowing_a_book_after_copies_have_been_added_returns_the_book
    isbn = "9780544003415"
    @library.add_copies(isbn, count: 1)
    book = @library.find(isbn)

    assert_equal book, @library.borrow(isbn)
  end

  def test_borrowing_a_book_when_all_copies_have_been_borrowed_returns_nil
    isbn = "9780544003415"
    @library.add_copies(isbn, count: 1)
    @library.borrow(isbn)

    assert_nil @library.borrow(isbn)
  end

  def test_returning_a_book_when_none_have_been_borrowed_returns_nil
    assert_nil @library.return("9780544003415")
  end

  def test_returning_a_book_when_some_have_been_borrowed_returns_the_book
    isbn = "9780544003415"
    book = @library.find(isbn)
    @library.add_copies(isbn, count: 1)
    @library.borrow(isbn)

    assert_equal book, @library.return(isbn)
  end

  def test_borrowed_returns_total_count_of_borrowed_books
    isbns = ["9780191604928", "9780718198916", "9780974514055"]
    isbns.each do |isbn|
      @library.add_copies(isbn, count: 1)
      @library.borrow(isbn)
    end

    assert_equal 3, @library.borrowed
  end

  def test_borrowed_returns_zero_when_nothing_is_borrowed
    assert_equal 0, @library.borrowed
  end
end
