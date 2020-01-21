class ShoppingCart
  def initialize
    fail NotImplementedError.new('Please implement the ShoppingCart#initialize method')
  end

  def add(sku)
    fail NotImplementedError.new('Please implement the ShoppingCart#add method')
  end

  def total_amount
    fail NotImplementedError.new('Please implement the ShoppingCart#total_amount method')
  end

  def items_list
    fail NotImplementedError.new('Please implement the ShoppingCart#items_list method')
  end
end
