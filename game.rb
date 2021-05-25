class Question
  attr_reader :question, :answer
  
  def initialize()
    x = rand(1..20)
    y = rand(1..20)
    @question = "What does #{x} plus #{y} equal?"
    @answer = x + y
  end
end

class Player
  attr_accessor :lives
  attr_reader :name

  def initialize(name)
    @lives = 3
    @name=name
  end

  def lost_life
    self.lives = lives - 1
  end
end


class Turn
  attr_reader :currentPlayer

  def initialize(player)
    @currentPlayer = player
  end
end

#################


gameOn = true

p1 = Player.new("Player 1")
p2 = Player.new("Player 2")

newTurn = Turn.new(p1)

while gameOn do
  q = Question.new()
  puts "#{newTurn.currentPlayer.name}: #{q.question}"
  #puts q.answer
  ans = gets.chomp

  if ans == q.answer.to_s
    puts "You got it right!"
  else
    puts "WRONG!"
    newTurn.currentPlayer.lost_life
  end

  puts "P1: #{p1.lives}/3 vs P2: #{p2.lives}/3"
  
  if p1.lives == 0 || p2.lives ==0
    puts p1.lives == 0 ? "Player 2 wins with a score of #{p2.lives}/3" : "Player 1 wins with a score of #{p1.lives}/3"
    puts "---- GAME OVER ----"
    puts "Good bye!"
    break
  end
  
  puts "---- NEW TURN ----"

  if newTurn.currentPlayer.name == "Player 1"
    newTurn = Turn.new(p2)
  else
    newTurn = Turn.new(p1)
  end

end