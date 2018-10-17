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

  def test_house_can_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal 2, house.rooms.length
  end

  def test_house_can_sort_rooms_by_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 2, house.rooms_from_category(:bedroom).length
    assert_equal 1900, house.area
  end

  def test_house_price_per_square_foot
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 210.53, house.price_per_square_foot
  end 

end
