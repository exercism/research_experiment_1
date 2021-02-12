# Readme

## Instructions

You are given a collection of library books, and your job is to import them into
the library's catalog system. The books are in the constant `Library::CATALOG_DATA`, and
each book has the following columns:
title, ISBN, author, and publishing year.

The public methods that you need to implement have been provided for you, but they're
currently empty.

The first three methods return information about the books:

```ruby
library = Library.new
library.lookup_title("9780718198916")
#=> "Republic"

library.lookup_author("9780191604928")
#=> "Mark Twain"

library.lookup_publication_year("9780451524935")
#=> "2009"
```

The library then has methods that need adding to handle stock.

- `add_stock!` increases the stock count of a book.
- `borrow!` decreases the stock count of a book if there are books in stock.
- `put_back!` increases the stock if any of the books are still borrowed.
- `lookup_stock` returns the current stock of a book.
- `book_in_stock?` returns a boolean representing whether there is at least 1 book in stock.
- `books_in_stock` lists the ISBNs of all books in stock, sorted alphabetically.
- `total_books_in_stock` returns the summed stock of all books.

A sample flow might look like this:

```ruby
library.add_stock!("9780451524935", 1)
library.lookup_stock("9780451524935")
#=> 1
library.book_in_stock?("9780451524935")
#=> true

library.borrow("9780451524935")
library.lookup_stock("9780451524935")
# => 0
library.book_in_stock?("9780451524935")
#=> false

# Borrowing a book that's out of stock does nothing
library.borrow("9780451524935")
library.lookup_stock("9780451524935")
# => 0

library.put_back!("9780451524935")
library.lookup_stock("9780451524935")
# => 1

# Putting back a book that's not been borrowed does nothing
library.put_back!("9780451524935")
library.lookup_stock("9780451524935")
# => 1

library.add_stock!("9780140283334", 2)
library.books_in_stock
# => ["9780140283334", "9780451524935"]
library.total_books_in_stock
# => 3
```

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using:

```ruby
debug("Debug message")
```
