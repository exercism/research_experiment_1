require 'minitest/autorun'
require_relative 'ruby_1_a'

class ShoppintCartTest < Minitest::Test
  def test_initial_total_amount
    assert_equal 0, ShoppingCart.new.total_amount
  end

  def test_one_item
    assert_equal 10, ShoppingCart.new(potatoes: 10.00).total_amount
  end

  def test_two_items
    assert_equal 40, ShoppingCart.new(potatoes: 10.00, rice: 30.00).total_amount
  end

  def test_list_items
    assert_equal 'potatoes, rice', ShoppingCart.new(potatoes: 10.00, rice: 30.00).items_list
  end
end
