class Piyo
  attr_reader :data
  def bunri(data)
    @data = data
    puts @data
  end

  def hoge(data)
    @data = data
    puts @data[:hoge]
    puts @data[:moge]
  end

  @data = { :hoge => "super hoge", :moge => "hyper moge"}
  Piyo.new.bunri(@data)
  Piyo.new.hoge(@data)
end
