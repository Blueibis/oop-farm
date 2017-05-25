require_relative 'crop'

class Corn < Crop

  attr_accessor :yield, :type

  def initialize(hectares)
    super(hectares)
    @yield = hectares * 20
    @type = "corn"
  end

end
