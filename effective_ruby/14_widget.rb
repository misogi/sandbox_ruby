class Widget
  def initialize(x, y)
    @screen_x = x
    @screen_y = y
  end

  def overlapping?(other)
    x1, y1 = screen_coordinates
    x2, y2 = other.screen_coordinates
  end
  
  protected
  
  def screen_coordinates
    [@screen_x, @screen_y]
  end
end