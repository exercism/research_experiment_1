class ShoppingCart
  def initialize(items = {})
    @items = items
  end

  def total_amount
    items.values.inject(0, :+)
  end

  def items_list
    items.keys.join(', ')
  end

  private

  attr_reader :items
end
