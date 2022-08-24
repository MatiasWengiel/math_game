class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def ask_question(chosen_player)
    #Determines the player not currently answering questions
    other_player = chosen_player == @player1 ? @player2 : @player1

    prompt = Question.new(chosen_player, other_player)
    #Asks question to chosen player, then awaits a response
    pp "#{chosen_player.name}: What does #{prompt.num1} plus #{prompt.num2} equal?"
    response = gets.chomp.to_i

    prompt.compare_answer(response)
    prompt.evaluate_lives
    ask_question(other_player)
  end
end

class Question
  attr_reader :num1, :num2, :sum

  def initialize(chosen_player, other_player)
    @chosen_player = chosen_player
    @other_player = other_player
    @num1 = self.random_num
    @num2 = self.random_num
    @sum = num1 + num2
  end

  def random_num
    rand(1..20)
  end

  def compare_answer(response)
    if response == self.sum
      pp "#{@chosen_player.name}: YES! You are correct."
      pp "#{@chosen_player.name}: #{@chosen_player.lives}/3 vs #{@other_player.name}: #{@other_player.lives}/3"
    else
      pp "#{@chosen_player.name}: Seriously? No!"
      @chosen_player.lives-= 1
      pp "#{@chosen_player.name}: #{@chosen_player.lives}/3 vs #{@other_player.name}: #{@other_player.lives}/3"
    end
  end

  def evaluate_lives
    if @chosen_player.lives == 0
    pp "----- WE HAVE A WINNER!! -----"
    pp "#{@other_player.name} wins with a score of #{@other_player.lives}/3"
    pp '----- GAME OVER -----'
    pp 'Good bye!'
    
    exit
    end
  end

end