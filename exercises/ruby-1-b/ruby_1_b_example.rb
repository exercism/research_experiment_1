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

  def initialize
    @inventory = books.keys.map { |isbn| [isbn, InventoryItem.new(isbn)] }.to_h
  end

  def books
    @books ||=
      BOOKS.each_line(chomp: true)
        .map { |line| line.split(";") }
        .map { |fields| Book.new(*fields) }
        .map { |book| [book.isbn, book] }
        .to_h
  end

  def inventory
    @inventory ||=
      books.keys
        .map { |isbn| [isbn, InventoryItem.new(isbn)] }
        .to_h
  end

  def find(isbn)
    books[isbn]
  end

  def borrow(isbn)
    if inventory_item(isbn).borrowable > 0
      inventory_item(isbn).borrowed += 1
      find(isbn)
    end
  end

  def return(isbn)
    if inventory_item(isbn).borrowed > 0
      inventory_item(isbn).borrowed -= 1
      find(isbn)
    end
  end

  def add_copies(isbn, count: count)
    raise ArgumentError unless inventory_item(isbn)

    inventory_item(isbn).copies += count
  end

  def borrowed
    inventory.values.sum(&:borrowed)
  end

  private

  def inventory_item(isbn)
    inventory[isbn]
  end
end

class Book
  attr_reader :title, :isbn, :author, :published

  def initialize(title, isbn, author, published)
    @title = title
    @isbn = isbn
    @author = author
    @published = published
  end
end

class InventoryItem
  attr_reader :isbn
  attr_accessor :copies, :borrowed

  def initialize(isbn)
    @isbn = isbn
    @copies = 0
    @borrowed = 0
  end

  def borrowable
    @copies - @borrowed
  end
end
