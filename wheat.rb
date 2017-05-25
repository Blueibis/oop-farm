require_relative 'crop'

class Wheat < Crop

  attr_accessor :yield, :type

  def initialize(hectares)
    super(hectares)
    @yield = hectares * 30
    @type = "wheat"
  end
end
