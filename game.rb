class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def random_num
    rand(1..20)
  end

  def prompt
    num1 = self.random_num
    num2 = self.random_num
    sum = num1 + num2

    pp "#{@player1.name}: What does #{num1} plus #{num2} equal?"
    response = gets.chomp.to_i
    pp response
    
  end

end
