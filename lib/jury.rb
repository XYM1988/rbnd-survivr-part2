require 'pp'
class Jury
  attr_reader :members
  attr_writer :members
  def initialize
    @members = []
  end
  
  def add_member(member)
    @members.push(member)
  end
  
  def cast_votes(final_list)
    result = Hash.new
    final_list.each do |member|
      # Initialize member list:
      result[member] = 0
    end
    prng = Random.new(1234)
    @members.each do |member|
      index = 0
      num = prng.rand(100)
      if num < 50
        index = 0
      else
        index = 1
      end
      key = result.keys[index]
      result[key] += 1
      puts "#{member.name} choose #{key}"
    end
    return result
  end
  def report_votes(final_list)
    final_list.each do |list_member, vote|
      puts "#{list_member.name} => #{vote}"
    end
  end
  
  def announce_winner(final_result)
    firstone = final_result.keys[0]
    secondone = final_result.keys[1]
    if final_result[firstone] > final_result[secondone]
      puts "The winner is: #{firstone} !"
      return firstone
    else
      puts "The winner is: #{secondone} !"
      return secondone
    end
  end
  
end
