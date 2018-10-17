class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all { |room|
      room.category == category
    }

  end

  def area
    length = @rooms.map do |room|
      room.length
    end
    width = @rooms.map do |room|
      room.width
    end

    paired = length.zip(width)
    each_area = paired.map do |x, y|
      x * y
    end
    each_area.sum #would have been easier to just use the room.area function & .sum
  end

  def price_per_square_foot
    price_per_foot = @price[1..@price.length].to_i / area.to_f
    price_per_foot.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by { |room|
      room.area
    }
  end


end
