class ShoppingCart
  def initialize(items = {})
    @names = items.keys
    @prices = items.values
  end

  def total_amount
    prices.inject(0, :+)
  end

  def items_list
    names.join(', ')
  end

  private

  attr_reader :names, :prices
end
