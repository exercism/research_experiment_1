## Introduction

This is Part 1 of our research into differences in the ways in which people write Ruby. This exercise should take 10-15 minutes for a programmer who is proficient in Ruby. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

You are given a collection of library books, and your job is to import them into
the library's catalog system. The books are in the constant `Library::CATALOG_DATA`, and
each book has the following columns:
title, ISBN, author, and publishing year.

The public methods that you need to implement have been provided for you, but they're
currently empty. This is what each method should do:

`lookup_title` takes an `isbn` as an argument, and returns the title of the
corresponding book
```ruby
library = Library.new
library.lookup_title("9780191604928")
=> "The Adventures of Tom Sawyer"
```

Similarly `lookup_author` returns the author
```ruby
library.lookup_author("9780718198916")
=> "Plato"
```
and `lookup_publication_year` returns the publication year
```ruby
library.lookup_publication_year("9781986431484")
=> "2018"
```

`add_stock!` increases the stock count of a book, and `lookup_stock` returns
the current stock of a book
```ruby
library.add_stock!("9780451524935", 5)
library.lookup_stock("9780451524935")
=> 5
```

`borrow!` decreases the stock count of a book if there are books in stock.
If the stock is already zero, then `borrow!` does nothing
```ruby
library.add_stock!("9780451524935", 1)
library.lookup_stock("9780451524935")
=> 1
library.borrow("9780451524935")
library.lookup_stock("9780451524935")
=> 0
library.borrow("9780451524935")
library.lookup_stock("9780451524935")
=> 0
```

`put_back!` does the opposite of `borrow!`. It increases the stock if any of the
books are still borrowed. If none of the books are borrowed it does nothing
```ruby
library.add_stock!("9780451524935", 1)
library.borrow("9780451524935")
library.put_back!("9780451524935")
library.lookup_stock("9780451524935")
=> 1
library.put_back!("9780451524935")
library.lookup_stock("9780451524935")
=> 1
```

`book_in_stock?` returns true if there's at least 1 book in stock, otherwise it
returns false

`books_in_stock` returns the isbns of books that have at least 1 book in stock
```ruby
isbns = ["9780544003415", "9780140283334", "9780451524935"]
isbns.each { |isbn| library.add_stock!(isbn, 1) }
library.books_in_stock
=> ["9780544003415", "9780140283334", "9780451524935"]
```

`total_books_in_stock` returns the summed stock of all books
```ruby
isbns = ["9780544003415", "9780140283334", "9780451524935"]
isbns.each { |isbn| library.add_stock!(isbn, 3) }
library.total_books_in_stock
=> 9
```

**Note:** You can use `debug("some test")` to output debugging information for yourself.
