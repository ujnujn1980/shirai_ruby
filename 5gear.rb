class Gear
  attr_reader :charing, :cog, :wheel

  def initialize(args)
    @charing = args[:charing]
    @cog     = args[:cog]
    @wheel   = args[:wheel]
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

#puts Gear.new(10,20, @Wheel).ratio
#puts Gear.new(10,20).ratio
#@Wheel = Wheel.new(200,30)
#puts Gear.new(10,20, @Wheel).gear_inches

@Wheel = Wheel.new(200,30)
@args = { :charing => 100,
          :cog     => 10, 
          :wheel   => @Wheel }
puts Gear.new(@args).gear_inches

