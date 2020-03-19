## Introduction

This is Part 1 of our research into differences in the ways in which people write Ruby. This exercise should take 10-15 minutes for a programmer who is proficient in Ruby. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to define a shopping cart for a corner shop. The cart should keep track of the list of items added, and correctly calculate the price.

Items are added to the basket using stock-keeping unit (SKU) codes. The items in the shop are:

| Name      | Price | SKU    |
| --------- | ----- | ------ |
| Potatoes  | 10.00 | STAPOT |
| Rice      | 30.00 | STARIC |
| Coffee    | 14.99 | STACOF |
| Newspaper | 2.99  | MEDNEW |

You need to define a `ShoppingCart` class, with three public methods:

- `add`: Takes a SKU and adds it to the cart. The SKU is a `Symbol` comprised of the first three uppercase letters of the product type + the first three uppercase letters of the product name.
- `total_amount`: The value of the items in the cart as a number with two decimal places (e.g. 3.99).
- `items_list`: A list of the names of the items in the cart, ordered alphabetically, with no duplicates, separated by a comma and a space.

For example:

```ruby
shopping_cart = ShoppingCart.new
shopping_cart.add(:STAPOT)
shopping_cart.add(:STARIC)

shopping_cart.total_amount
// Returns: 40.00

shopping_cart.items_list
// Returns: "Potatoes, Rice"
```

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using:

```ruby
debug("Debug message")
```
