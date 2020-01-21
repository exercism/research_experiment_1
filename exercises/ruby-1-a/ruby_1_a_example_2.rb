# frozen_string_literal: true

class ShoppingCart
  attr_reader :contents, :stock
  def initialize
    @contents = Hash.new { |h, k| h[k] = 0 }
    @stock = [
      [:D69856, 'Potatoes', 10.00],
      [:F55690, 'Rice', 30.00],
      [:C662F6, 'Coffee', 14.99],
      [:B48C0D, 'Newspaper', 2.99]
    ]
  end

  def add(sku)
    contents[sku] += 1
  end

  def total_amount
    contents.sum do |sku, quantity|
      stock_item = stock_for_sku(sku)
      stock_item[2] * quantity
    end.round(2)
  end

  def items_list
    contents.keys.map { |sku| stock_for_sku(sku)[1] }.sort.join(', ')
  end

  def stock_for_sku(sku)
    stock.find { |s| s[0] == sku }
  end
end
