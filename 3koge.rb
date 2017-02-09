class OR
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def diameters
    data.collect {|cell|
    #  cell[0] + (cell[1] * 2)}
    cell[0] + calc(cell[1])}
  end

  def calc(x)
      x * 2 
  end

@data = [[522,20],[622,23],[559,30],[559,40]]

puts OR.new(@data).diameters

end

