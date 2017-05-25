require_relative 'crop'

class Potato < Crop

  attr_accessor :yield, :type

  def initialize(hectares)
    super(hectares)
    @yield = hectares * 20
    @type = "potato"
  end

end
