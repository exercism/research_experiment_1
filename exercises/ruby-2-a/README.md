## Introduction

This is Part 2 of our research into how people write Ruby differently. This exercise should take 10-15 minutes for a programmer who is proficient in Ruby. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to extend the existing code with new functionality. The existing code simulates a shopping cart from the corner shop. The current shopping cart has a limited list of available products:

| Name      | Price | SKU    |
| --------- | ----- | ------ |
| Potatoes  | 10.00 | STAPOT |
| Rice      | 30.00 | STARIC |
| Coffee    | 14.99 | STACOF |
| Newspaper | 2.99  | MEDNEW |

And provides three public methods:

- `ShoppingCart#add(sku)`: Takes a stock-keeping unit (SKU) and adds it to the cart.
- `ShoppingCart#total_amount`: The value of the items in the cart as a number with two decimal places (e.g. 3.99).
- `ShoppingCart#items_list`: A list of the names of the items in the cart, ordered alphabetically, with no duplicates, separated by a comma and a space.

For example:

```ruby
shopping_cart.add(:STAPOT)
shopping_cart.add(:STARIC)

shopping_cart.total_amount
// Returns: 40.00

shopping_cart.items_list
// Returns: "Potatoes, Rice"
```

In order to keep customers happy, the shop has added discount coupons. This means that the code extension should be able to read and apply discount coupons to the current items. The supported coupons are:

| Type                 | SKU         | Rule                                             |
| -------------------- | ----------- | ------------------------------------------------ |
| Fixed price discount | FIX_TEN     | Discounts 10.00 off the total amount of the cart |
| Product discount     | HALF_STAPOT | Reduces all STAPOT items to half price           |

Your task is to define a new `ShoppingCart#scan_coupon` method which takes a SKU and adds it to the cart. The SKU is a `Symbol` comprised of the first three uppercase letters of the discount type + the SKU of the relevant product. In case the coupon type is a fixed price discount, the second part of the SKU is the discounted amount in uppercase letters. Coupons are unique and can be applied only once.

Please bear in mind that the `total_amount` must not be a negative number, the minimum value for the `total_amount` is 0.

Example:

```ruby
shopping_cart = ShoppingCart.new
shopping_cart.add(:STAPOT)
shopping_cart.add(:MEDNEW)
shopping_cart.add(:MEDNEW)
shopping_cart.scan_coupon(:FIX_TEN)

shopping_cart.total_amount
// Returns: 5.98
```

**Note:** You can use `debug("some test")` to output debugging information for yourself.
