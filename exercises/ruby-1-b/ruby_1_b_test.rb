require 'minitest/autorun'
require_relative 'ruby_1_b.rb'

class LibraryTest < Minitest::Test
  def setup
    @library = Library.new
  end

  def test_lookup_title_returns_correct_title
    assert_equal "The Adventures of Tom Sawyer", @library.lookup_title("9780191604928")
  end

  def test_lookup_author_returns_correct_author
    assert_equal "Plato", @library.lookup_author("9780718198916")
  end

  def test_lookup_publication_year_returns_correct_publication_year
    assert_equal "2004", @library.lookup_publication_year("9780974514055")
  end

  def test_add_stock_changes_correct_stock
    @library.add_stock!("9781986431484", 5)
    assert_equal 5, @library.lookup_stock("9781986431484")
  end

  def test_add_stock_does_not_change_stock_for_other_book
    @library.add_stock!("9781986431484", 5)
    assert_equal 0, @library.lookup_stock("9780446310789")
  end

  def test_book_in_stock_when_no_stock_has_been_added
    refute @library.book_in_stock?("9781986431484")
  end

  def test_book_in_stock_when_num_in_stock_is_at_least_one
    @library.add_stock!("9781986431484", 1)
    assert @library.book_in_stock?("9781986431484")
  end

  def test_borrowing_book_with_stock_of_one
    @library.add_stock!("9780330319089", 1)
    @library.borrow!("9780330319089")
    refute @library.book_in_stock?("9780330319089")
  end

  def test_borrowing_book_with_stock_more_than_one
    @library.add_stock!("9780330319089", 2)
    @library.borrow!("9780330319089")
    assert @library.book_in_stock?("9780330319089")
  end

  def test_put_back_when_book_has_not_been_borrowed
    @library.put_back!("9780330319089")
    assert_equal 0, @library.lookup_stock("9780330319089")
  end

  def test_put_back_when_book_has_been_borrowed
    @library.add_stock!("9780330319089", 1)
    @library.borrow!("9780330319089")
    @library.put_back!("9780330319089")
    assert_equal 1, @library.lookup_stock("9780330319089")
  end

  def test_books_in_stock
    isbns = ["9780544003415", "9780140283334", "9780451524935"]
    isbns.each { |isbn| @library.add_stock!(isbn, 1) }
    assert_equal isbns.sort, @library.books_in_stock.sort
  end

  def test_total_books_in_stock
    isbns = ["9780544003415", "9780140283334", "9780451524935"]
    isbns.each { |isbn| @library.add_stock!(isbn, 2) }
    assert_equal 6, @library.total_books_in_stock
  end
end
