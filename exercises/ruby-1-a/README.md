## Introduction

This is Part 1 of our research into how people write Ruby differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to define a shopping cart for a corner shop. The cart should keep track of the list of items added, and correctly calculate the price.

Items are added to the basket using stock-keeping unit (SKU) codes. The items in the shop are:

| Name      | Price | SKU    |
|-----------|-------|--------|
| Potatoes  | 10    | STAPOT |
| Rice      | 30    | STARIC |
| Coffee    | 14.99 | STACOF |
| Newspaper | 2.99  | MEDNEW |

You need to define a `ShoppingCart` class, with three public methods:
- `add`: Takes an SKU and adds it to the cart. The SKU is comprised of the first three upcased chars of the product type + the first three upcased chars of the product name.
- `total_amount`: The value of the items in the cart as a number with two decimal places (e.g. 3.99).
- `items_list`: A list of the names of the items in the cart, separated by commas.

For example:

```ruby
shopping_cart = ShoppingCart.new
shopping_cart.add(D69856)
shopping_cart.add(F55690)

shopping_cart.total_amount
// Returns: 40

shopping_cart.items_list
// Returns: "potatoes, rice"
```

**Note:** You can use `debug("some test")` to output debugging information for yourself.
