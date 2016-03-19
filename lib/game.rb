require 'colorizr'
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
    prng = Random.new()
    index = prng.rand(@tribes.length)
    puts "#{@tribes[index]}".yellow + " loses!"
    return @tribes[index]
  end
  
  def clear_tribes
    @tribes = []
    return @tribes
  end
  
  def merge(tribe_name)
    puts "Merge Begin!".green
    member_result = []
    @tribes.each do |tribe|
      member_result += tribe.members
    end
    new_tribe = Tribe.new({name: tribe_name, members: member_result})
    self.clear_tribes
    self.add_tribe(new_tribe)
    return new_tribe
  end
  
  def individual_immunity_challenge
    merged_tribe = @tribes[0]
    prng = Random.new()
    index = prng.rand(merged_tribe.members.length)
    immune_guy = merged_tribe.members[index]
    return immune_guy
  end
end




