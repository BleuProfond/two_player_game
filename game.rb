@player1 = {
  lives: 3,
  name: "Player 1"
}

@player2 = {
  lives: 3,
  name: "Player 2"
}

def question_generator(player)
  x = rand(1..9)
  y = rand(1..9)
  operator = ["+", "-", "*"].sample
  actual_answer = x.send(operator, y)
  puts "#{player[:name]}, what is #{x} #{operator} #{y}?"
  player_answer = gets.chomp
  confirm_answer(player, player_answer, actual_answer)
end

def confirm_answer(player, player_answer, actual_answer)
  if player_answer.to_i == actual_answer
    puts "CORRECT!"
  else
    puts "WRONG!"
    player[:lives] -= 1
    puts "Player 1 has #{@player1[:lives]} lives! Player 2 has #{@player2[:lives]} lives!"
  end
end

def start_game
  puts "WELCOME TO MATH HELL!"
  while true
  question_generator(@player1)
  break if @player1[:lives] == 0
  question_generator(@player2)
  break if @player2[:lives] == 0
  end
end

start_game