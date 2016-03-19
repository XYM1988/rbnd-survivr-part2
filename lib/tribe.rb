class Tribe
  attr_reader :name, :members
  
  def initialize(options={})
    @name = options[:name]
    @members = options[:members]
    puts "Finish Initialization"
  end
  
  def to_s
    return @name
  end

  def tribal_council(immune)
    result = nil
    flag = true
    prng = Random.new(1234)
    while flag == true
      index = prng.rand(@members.length)
      chosen = @members[index]
      if chosen != immune
        result = chosen
        flag = false
      end
    end
    return result
  end
end