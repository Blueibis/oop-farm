class Pasture

  attr_accessor :amount

  def initialize(amount)
    @amount = amount
    add
  end

  def breed
    @amount += Random.rand(amount)
  end

end
