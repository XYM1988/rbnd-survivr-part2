class Contestant
  attr_reader :name
  def initialize(name)
    @name = name
  end
  
  def to_s
    return @name
  end
end