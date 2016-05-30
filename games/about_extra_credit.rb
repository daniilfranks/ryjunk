# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

require_relative 'about_scoring_project'
require_relative 'about_dice_project'

class Player

  attr_reader :finished, :name, :score

  def initialize name
  	@name = name
  	@score = 0
  	@finished = false
  end	

  def save_score score
    @score+= score
  
    @finished = true if @score >= 3000
  end
end

class Greeds
  def initialize dice_set = nil
  	@dice_set = dice_set
  	@result = nil
  	@no_of_rolls = 0
  end

  def play 
  	nisse =  @dice_set.roll(5)
    @result = score2(@dice_set.roll(5))
  end
end


$no = 0
def get_cycle players
   $no+=1
   players[$no % players.size]

end


if __FILE__ == $PROGRAM_NAME

  players = [Player.new("Janne"), Player.new("Olle"), Player.new("Sussi")]
 
  dice = DiceSet.new
  greed = Greeds.new(dice)
        
  count = 0
        
  while true
            
    player = get_cycle(players)
            

    break if player.finished
    # Everyone had a chance after ther first scored 30000
               
            
    player.save_score(greed.play())
    count+= 1
            

            
  end

  puts "count:", count
  
  players.each do | player | 
    puts "player: #{player.name}, score: #{player.score}"
  end	

end