# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'ruby_2_a.rb'

class ShoppingCartTest < Minitest::Test
  def test_initial_total_amount
    assert_equal 0.00, ShoppingCart.new.total_amount
  end

  def test_one_item
    cart = ShoppingCart.new
    cart.add(:STAPOT)
    assert_equal 10.00, cart.total_amount
  end

  def test_two_items
    cart = ShoppingCart.new
    cart.add(:STAPOT)
    cart.add(:STARIC)
    assert_equal 40.00, cart.total_amount
  end

  def test_list_items
    cart = ShoppingCart.new
    cart.add(:STAPOT)
    cart.add(:STARIC)
    assert_equal 'Potatoes, Rice', cart.items_list
  end

  def test_items_ordered_alphabetically
    cart = ShoppingCart.new
    cart.add(:STARIC)
    cart.add(:STAPOT)
    assert_equal 'Potatoes, Rice', cart.items_list
  end

  def test_duplicate_items_sums_price
    cart = ShoppingCart.new
    cart.add(:STARIC)
    cart.add(:STACOF)
    cart.add(:STACOF)
    assert_equal 59.98, cart.total_amount
  end

  def test_duplicate_items_uniqs_list
    cart = ShoppingCart.new
    cart.add(:STARIC)
    cart.add(:MEDNEW)
    cart.add(:MEDNEW)
    assert_equal 'Newspaper, Rice', cart.items_list
  end

  def test_fix_price_coupon
    cart = ShoppingCart.new
    cart.add(:STAPOT)
    cart.add(:MEDNEW)
    cart.add(:MEDNEW)
    cart.scan_coupon(:FIX_TEN)

    assert_equal 5.98, cart.total_amount
  end

  def test_items_list_does_not_include_discounts
    cart = ShoppingCart.new
    cart.add(:MEDNEW)
    cart.scan_coupon(:FIX_TEN)

    assert_equal 'Newspaper', cart.items_list
  end
  def test_product_discount_coupon
    cart = ShoppingCart.new
    cart.add(:STAPOT)
    cart.add(:STAPOT)
    cart.add(:MEDNEW)
    cart.scan_coupon(:HALF_STAPOT)

    assert_equal 12.99, cart.total_amount
  end

  def test_coupon_does_not_apply
    cart = ShoppingCart.new
    cart.add(:STAPOT)
    cart.add(:STAPOT)
    cart.scan_coupon(:INVALID)

    assert_equal 20.00, cart.total_amount
  end

  def test_duplicated_coupons
    cart = ShoppingCart.new
    cart.add(:STAPOT)
    cart.add(:STAPOT)
    cart.scan_coupon(:FIX_TEN)
    cart.scan_coupon(:FIX_TEN)

    assert_equal 10.00, cart.total_amount
  end

  def test_negative_balance
    cart = ShoppingCart.new
    cart.add(:MEDNEW)
    cart.scan_coupon(:FIX_TEN)

    assert_equal 0.00, cart.total_amount
  end
end
