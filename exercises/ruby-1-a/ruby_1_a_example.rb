class ShoppingCart
  def initialize(items = {})
    @items = items
  end

  def total_amount
    items.sum(0) { |key, value| value }
  end

  def items_list
    items.keys.join(', ')
  end

  private

  attr_reader :items
end
