class Gear
  attr_reader :cog, :chainring
  def initialize(cog, chainring)
    @cog = cog
    @chainring = chainring
  end

  def ratio
    chainring / cog.to_f
  end
end

puts Gear.new(10,20).ratio
puts Gear.new(20,10).ratio
