class ShoppingCart < Hash
  StockItem = Struct.new(:name, :price) do
  end

  STOCK = {
    D69856: StockItem.new("Potatoes", 10.0),
    F55690: StockItem.new("Rice", 30.00),
    C662F6: StockItem.new("Coffee", 14.99),
    B48C0D: StockItem.new("Newspaper", 2.99)
  }

  attr_reader :contents, :stock
  def initialize
    super {|h,k|h[k] = 0}
  end

  def add(sku)
    self[sku] += 1
  end

  def total_amount
    sum {|sku, quantity| STOCK[sku].price * quantity }.round(2)
  end

  def items_list
    keys.map{|sku| STOCK[sku].name}.
         sort.
         join(", ")
  end
end
