class Crop
@@harvest= []

attr_accessor :hectares

  def initialize(hectares)
    @hectares = hectares
    store
  end

  def store
    @@harvest << self
  end

  def self.all
    @@harvest
  end

end
