class Library
  def self.books
    @books ||= import_books
  end

  def self.import_books
    file_name = "books.txt"
    IO.readlines(file_name, chomp: true).drop(1)
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
