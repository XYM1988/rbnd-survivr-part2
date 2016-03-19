require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  elimations = []
  8.times do
    failed_tribe = @borneo.immunity_challenge
    elimitated_person = failed_tribe.tribal_council
    elimations.push(elimitated_person)
    failed_tribe.remove_member(elimitated_person)
  end
  return elimations.length
end

def phase_two
  elimations = []
  3.times do
    immune_guy = @borneo.individual_immunity_challenge
    elimitated_person = @borneo.tribes[0].tribal_council
    @borneo.tribes[0].remove_member(elimitated_person)
    elimations.push(elimitated_person)
  end
  return elimations.length
end

def phase_three
  7.times do
    jury_member = @borneo.tribes[0].tribal_council
    @borneo.tribes[0].remove_member(jury_member)
    @jury.add_member(jury_member)
  end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
## @borneo.tribes.each do |tribes|
##   puts tribes.members
## end
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
