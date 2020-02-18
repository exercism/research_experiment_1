class Library

  # Title;ISBN;Author;Published
  BOOKS = <<~DATA
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

  def find(isbn)
    # start by implementing this Library#find method
  end

  def add_copies(isbn, count: count)
    # TODO: implement
  end

  def borrow(isbn)
    # TODO: implement
  end

  def return(isbn)
    # TODO: implement
  end

  def borrowed
    # TODO: implement
  end
end
