class Library

  # Title;ISBN;Author;Published
  CATALOG_DATA = <<~DATA
    The Adventures of Tom Sawyer;9780191604928;Mark Twain;2007
    Republic;9780718198916;Plato;2012
    Programming Ruby: The Pragmatic Programmers' Guide;9780974514055;David Thomas;2004
    Pride and Prejudice by Jane Austen;9781986431484;Jane Austen;2018
    To Kill a Mockingbird;9780446310789;Harper Lee;1988
    Cosmicomics;9780330319089;Italo Calvino;1969
    The Lord of the Rings;9780544003415;J. R. R. Tolkien;2012
    Lord of the Flies;9780140283334;William Golding;1999
    1984: A Novel;9780451524935;George Orwell;2009
  DATA

  def lookup_title(isbn)
  end

  def lookup_author(isbn)
  end

  def lookup_publication_year(isbn)
  end

  def add_stock!(isbn, count)
  end

  def lookup_stock(isbn)
  end

  def borrow!(isbn)
  end

  def put_back!(isbn)
  end

  def book_in_stock?(isbn)
    raise NotImplementedError, 'Please implement the Library#book_in_stock? method'
  end

  def books_in_stock
    raise NotImplementedError, 'Please implement the Library#books_in_stock method'
  end

  def total_books_in_stock
    raise NotImplementedError, 'Please implement the Library#total_books_in_stock method'
  end
end
