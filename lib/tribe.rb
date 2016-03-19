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

  def remove_member(member)
    result = []
    @members.each do |each_one|
      if each_one != member
        result.push(each_one)
      end
    end
    puts "#{member.name}".blue + "is removed"
    @members = result
  end
  def tribal_council(immune = nil)
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