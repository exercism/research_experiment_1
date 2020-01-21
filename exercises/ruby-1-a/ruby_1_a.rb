class ShoppingCart
  def initialize(items)
    fail NotImplementedError.new('Please implement the ShoppingCart initializer')
  end

  def total_amount
    fail NotImplementedError.new('Please implement the ShoppingCart#total_amount method')
  end

  def items_list
    fail NotImplementedError.new('Please implement the ShoppingCart#items_list method')
  end
end
