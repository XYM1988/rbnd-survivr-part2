class Game
  attr_reader :tribes
  def initialize(tribe_1, tribe_2)
    @tribes = []
    @tribes.push(tribe_1)
    @tribes.push(tribe_2)
  end
  
  def add_tribe(tribe)
    @tribes.push(tribe)
  end
  
  def immunity_challenge
    prng = Random.new(1234)
    index = prng.rand(@tribes.length)
    return @tribes[index]
  end
  
  def clear_tribes
    @tribes = []
    return @tribes
  end
  
  def merge(tribe_name)
    member_result = []
    @tribes.each do |tribe|
      member_result += tribe.members
    end
    return Tribe.new({name: tribe_name, members: member_result})
  end
  
  def individual_immunity_challenge
    merged_tribe = self.merge("final")
    prng = Random.new(1234)
    index = prng.rand(merged_tribe.members.length)
    return merged_tribe.members[index]
  end
end




