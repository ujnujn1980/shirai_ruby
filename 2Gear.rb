class Gear
  attr_reader :cog, :chainring, :rim, :tire #フィールドをカプセル化する
  def initialize(cog, chainring, rim, tire) #コンストラクタ
    @cog = cog
    @chainring = chainring
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f # return chainring / cog.to_f と同じ
  end

  def gear_inchs
    ratio * (rim + ( tire * 2))
  end
end

#puts Gear.new(100,20).ratio
#puts Gear.new(20,10).ratio
#puts Gear.new(100,10,10,2).gear_inchs
#puts Gear.new(20,10,10,2).gear_inchs
puts Gear.new(52,11,26,1.5).gear_inchs
puts Gear.new(30,27,24,1.25).gear_inchs

# ruby Gear.rb
