class Moge
  attr_reader :num1, :num2

  def initialize(num1, num2)
    @num1 = num1
    @num2 = num2
  end

  def count
    range = @num1..@num2
    range.each {|num|
      p num
    }
  end

Moge.new(1,20).count

end
