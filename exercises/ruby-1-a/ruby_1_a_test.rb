# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'ruby_1_a'

class ShoppintCartTest < Minitest::Test
  def test_initial_total_amount
    assert_equal 0, ShoppingCart.new.total_amount
  end

  def test_one_item
    cart = ShoppingCart.new
    cart.add(:D69856)
    assert_equal 10, cart.total_amount
  end

  def test_two_items
    cart = ShoppingCart.new
    cart.add(:F55690)
    cart.add(:D69856)
    assert_equal 40, cart.total_amount
  end

  def test_list_items
    cart = ShoppingCart.new
    cart.add(:D69856)
    cart.add(:F55690)
    assert_equal 'Potatoes, Rice', cart.items_list
  end

  def test_items_ordered_alphabetically
    cart = ShoppingCart.new
    cart.add(:F55690)
    cart.add(:D69856)
    assert_equal 'Potatoes, Rice', cart.items_list
  end

  def test_duplicate_items_sums_price
    cart = ShoppingCart.new
    cart.add(:F55690)
    cart.add(:C662F6)
    cart.add(:C662F6)
    assert_equal 59.98, cart.total_amount
  end

  def test_duplicate_items_uniqs_list
    cart = ShoppingCart.new
    cart.add(:F55690)
    cart.add(:B48C0D)
    cart.add(:B48C0D)
    assert_equal 'Newspaper, Rice', cart.items_list
  end
end
