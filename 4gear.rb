class Gear
  attr_reader :charing, :cog, :wheel

  def initialize(charing, cog, wheel = nil)
    @charing = charing
    @cog     = cog
    @wheel   = wheel
  end

  def ratio
    charing / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim  = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::pi
  end

end

@Wheel = Wheel.new(20,30)
puts Gear.new(10,20, @Wheel).ratio
puts Gear.new(10,20).ratio
@Wheel = Wheel.new(200,30)
puts Gear.new(10,20, @Wheel).gear_inches
