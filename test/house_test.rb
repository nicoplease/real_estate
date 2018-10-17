require "minitest/autorun"
require "minitest/pride"
require "./lib/house"
require "./lib/room"

class HouseTest < Minitest::Test
  def test_it_exists
    house = House.new("$1", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_house_has_a_price
    house = House.new("$400000", "123 sugar lane")

    assert_equal "$400000", house.price
  end

  def test_house_has_an_address_and_itsnt_floating_in_the_ether
    house = House.new("$400000", "123 sugar lane")

    assert_equal "123 sugar lane", house.address
  end

  def test_default_house_has_no_rooms
    house = House.new("$400000", "123 sugar lane")

    assert_equal ([]), house.rooms
  end 
end
