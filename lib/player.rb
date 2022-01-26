class Player
  attr_accessor :name, :color

  def initialize(color, name = nil)
    @name = name
    @color = color
  end
end
