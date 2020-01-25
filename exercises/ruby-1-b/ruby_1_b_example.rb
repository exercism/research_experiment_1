class Library
  BOOKS_FILE = "books.txt".freeze

  def self.books
    @books ||= import_books
  end

  def self.import_books
    IO.readlines(BOOKS_FILE, chomp: true).drop(1)
      .map { |line| line.split(";") }
      .map { |fields| Book.new(*fields) }
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
