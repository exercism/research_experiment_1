## Introduction

This is Part 1 of our research into how people write Ruby differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to develop a shopping cart that will allow us to calculate the cart's full price as well as obtain a list of the items that are going to be purchased. This will be modelled as `ShoppingCart` class that can receive a hash of items where the key is the name of the item and the value the price of the item, see the example below. The `ShoppingCart` class will also have two methods: `total_amount` and `items_list`. The method `total_amount` will return the sum of all the items’ prices. The method `items_list` will return a string with the name of the items separated by commas.

For example:

```ruby
shopping_cart = ShoppingCart.new({ potatoes: 10.00, bananas: 30.00 })

shopping_cart.total_amount
// Returns: 40

shopping_cart.items_list
// Returns: "potatoes, bananas"
```

**Note:** You can use `debug("some test")` to output debugging information for yourself.
