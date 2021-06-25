# frozen_string_literal: true

class ShoppingCart
  Item = Struct.new(:sku, :price, :name)

  FixDiscount = Struct.new(:sku, :amount) do
    def apply(_items)
      amount
    end
  end

  HalfPriceDiscount = Struct.new(:sku, :apply_to_sku) do
    def apply(items)
      items.select { |t| t.sku == apply_to_sku }.map(&:price).sum.to_f / 2
    end
  end

  STOCK = [
    Item.new(:STAPOT, 10.00, 'Potatoes'),
    Item.new(:STARIC, 30.00, 'Rice'),
    Item.new(:STACOF, 14.99, 'Coffee'),
    Item.new(:MEDNEW, 2.99, 'Newspaper')
  ].freeze

  DISCOUNTS = [
    FixDiscount.new(:FIX_TEN, 10),
    HalfPriceDiscount.new(:HALF_STAPOT, :STAPOT)
  ].freeze

  def initialize
    @content = []
    @discounts = []
  end

  def total_amount
    [(subtotal - discount).round(2), 0].max
  end

  def add(sku)
    content << STOCK.find { |item| item.sku == sku }
  end

  def scan_coupon(sku)
    discounts << DISCOUNTS.find { |discount| discount.sku == sku }
  end

  def items_list
    content.map(&:name).uniq.sort.join(', ')
  end

  private

  attr_reader :content, :discounts

  def subtotal
    content.map(&:price).sum
  end

  def uniq_discounts
    discounts.compact.uniq(&:sku)
  end

  def discount
    uniq_discounts.map { |discount| discount.apply(content) }.sum
  end
end
