# frozen_string_literal: true

class ShoppingCart
  STOCK = {
    D69856: ['Potatoes', 10.0],
    F55690: ['Rice', 30.00],
    C662F6: ['Coffee', 14.99],
    B48C0D: ['Newspaper', 2.99]
  }.freeze

  def initialize
    @contents = []
  end

  def add(sku)
    contents.push(sku)
  end

  def total_amount
    contents.map { |sku| STOCK[sku][1] }.sum.round(2)
  end

  def items_list
    contents.map { |sku| STOCK[sku][0] }.uniq.sort.join(', ')
  end

  private

  attr_reader :contents
end
