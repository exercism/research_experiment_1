# frozen_string_literal: true

class ShoppingCart
  STOCK = {
    STAPOT: ['Potatoes', 10.0],
    STARIC: ['Rice', 30.00],
    STACOF: ['Coffee', 14.99],
    MEDNEW: ['Newspaper', 2.99]
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
