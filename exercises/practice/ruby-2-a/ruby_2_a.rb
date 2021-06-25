# frozen_string_literal: true

class ShoppingCart
  def add(sku)
    raise NotImplementedError, 'Please implement the ShoppingCart#add method'
  end

  def total_amount
    raise NotImplementedError, 'Please implement the ShoppingCart#total_amount method'
  end

  def items_list
    raise NotImplementedError, 'Please implement the ShoppingCart#items_list method'
  end

  def scan_coupon(sku)
    raise NotImplementedError, 'Please implement the ShoppingCart#scan_coupon method'
  end
end
