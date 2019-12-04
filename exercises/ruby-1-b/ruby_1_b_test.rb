require 'minitest/autorun'
require_relative 'ruby_1_b'

# Common test data version: 1.2.0 4fc1acb
class StubbedTest < Minitest::Test
  def test_passes
    assert true
  end
end
