require "minitest/autorun"
require "minitest/pride"
require "./lib/room"

class RoomTest < Minitest::Test
  def test_it_exists
    room = Room.new(:bedroom)

    assert_instance_of Room, room
  end

  def test_it_has_a_category
    room = Room.new(:bedroom)

    assert_equal :bedroom, room.category
  end

  def test_it_can_have_dimesions
    room = Room.new(:bedroom, 10, 13)

    assert_equal 10, room.length
    assert_equal 13, room.width
  end

  def test_area_method
    room = Room.new(:bedroom, 10, 13)

    assert_equal 130, room.area
  end



end
