## Introduction

This is Part 1 of our research into how people write Ruby differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to define a `ShoppingCart` class that can receive a hash of items and has two methods: `total_amount` and `items_list`. The method `total_amount` will return the sum of all the items’ prices. The method `list` will return a string with the name of the items separated by commas.

For example:

```ruby
shopping_cart = ShoppingCart.new({ potatoes: 10.00, bananas: 30.00 })

shopping_cart.total_amount
// Returns: 40

shopping_cart.items_list
// Returns: "potatoes, bananas"
```

**Note:** You can use debug("some test") to output debugging information for yourself.
