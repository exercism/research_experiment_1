# frozen_string_literal: true

class ShoppingCart < Hash
  StockItem = Struct.new(:name, :price)

  STOCK = {
    STAPOT: StockItem.new('Potatoes', 10.0),
    STARIC: StockItem.new('Rice', 30.00),
    STACOF: StockItem.new('Coffee', 14.99),
    MEDNEW: StockItem.new('Newspaper', 2.99)
  }.freeze

  attr_reader :contents, :stock

  def initialize
    super { |h, k| h[k] = 0 }
  end

  def add(sku)
    self[sku] += 1
  end

  def total_amount
    sum { |sku, quantity| STOCK[sku].price * quantity }.round(2)
  end

  def items_list
    keys.map { |sku| STOCK[sku].name }.sort.join(', ')
  end

  def scan_coupon(sku)
    fail NotImplementedError, 'Please implement the ShoppingCart#scan_coupon method'
  end
end
