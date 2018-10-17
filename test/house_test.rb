require "minitest/autorun"
require "minitest/pride"
require "./lib/house"
require "./lib/room"

class HouseTest < Minitest::Test
  def test_it_exists
    house = House.new("$1")

    assert_instance_of House, house
  end

  def test_house_has_a_price
    house = House.new("$400000")

    assert_equal "$400000", house.price
  end

end
