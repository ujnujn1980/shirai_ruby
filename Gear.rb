class Gear
  attr_reader :cog, :chainring #フィールドをカプセル化する
  def initialize(cog, chainring) #コンストラクタ
    @cog = cog
    @chainring = chainring
  end

  def ratio
    chainring / cog.to_f # return chainring / cog.to_f と同じ
  end
end

puts Gear.new(100,20).ratio
puts Gear.new(20,10).ratio

# ruby Gear.rb
