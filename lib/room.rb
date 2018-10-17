class Room

  attr_reader :category, :length, :width

  def initialize(category, length = 0, width = 0)
    @category = category
    @width = width
    @length = length
  end
  
  def area
    @length * @width
  end


end
