class Library
  def self.books
    @books ||= import_books
  end

  def self.import_books
    fail NotImplementedError, "you must import the books from 'books.txt'"
  end
end
