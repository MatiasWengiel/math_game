class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def random_num
    rand(1..20)
  end

  def prompt(chosen_player)
    #Determines the player not currently answering questions
    other_player = chosen_player == @player1 ? @player2 : @player1

    #Math variables
    num1 = self.random_num
    num2 = self.random_num
    sum = num1 + num2
    
    #Asks question to chosen player, then awaits a response
    pp "#{chosen_player.name}: What does #{num1} plus #{num2} equal?"
    response = gets.chomp.to_i
    
    #Compares response to correct answer and updates lives accordingly
    if response == sum
      pp "#{chosen_player.name}: YES! You are correct."
      pp "#{chosen_player.name}: #{chosen_player.lives}/3 vs #{other_player.name}: #{other_player.lives}/3"
    else
      pp "#{chosen_player.name}: Seriously? No!"
      chosen_player.lives-= 1
      pp "#{chosen_player.name}: #{chosen_player.lives}/3 vs #{other_player.name}: #{other_player.lives}/3"
    end

    #Ends game if chosen_player is out of lives at the end of the last prompt. Otherwise, runs prompt using other_player as the chosen one
    if chosen_player.lives == 0
      pp "----- WE HAVE A WINNER!! -----"
      pp "#{other_player.name} wins with a score of #{other_player.lives}/3"
      pp '----- GAME OVER -----'
      pp 'Good bye!'
    else
     pp '----- NEW TURN -----'
     prompt(other_player)
    end
    
  end

end
