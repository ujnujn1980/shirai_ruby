class Wheel
  attr_reader :wheels, :tire, :rim

  def initialize(wheels)
    @wheels = wheelify(wheels)
  end

  def diameters
    wheels.collect {|wheel|
      wheel.tire + (wheel.rim * 2)}
  end

  Wheels = Struct.new(:tire,:rim)
  def wheelify(data)
    data.collect {|cell|
      Wheels.new(cell[0], cell[1])}
      #Wheel.new(cell[0][0])}
      #puts cell}
  end

@data = [[522,20],[622,23],[559,30],[559,40]]
#@data = [[522,20],[522,20]]

puts Wheel.new(@data).diameters
#puts Wheel.new(@data)

end

