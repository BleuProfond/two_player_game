require 'pry'
require 'colorize'

@players = [
  @player1 = {
    lives: 3,
    name: "Player 1",
    score: 0
  },

  @player2 = {
    lives: 3,
    name: "Player 2",
    score: 0
  }
]

def question_generator(player)
  x = rand(1..20)
  y = rand(1..20)
  operator = ["+", "-", "*"].sample
  actual_answer = x.send(operator, y)
  puts "#{player[:name]}, what is #{x} #{operator} #{y}?".blue
  player_answer = gets.chomp
  confirm_answer(player, player_answer, actual_answer)
end

def confirm_answer(player, player_answer, actual_answer)
  if player_answer.to_i == actual_answer
    puts "CORRECT!".green
    player[:score] += 1
  else
    puts "WRONG!".red
    player[:lives] -= 1
    puts "Player 1 has #{@player1[:lives]} lives! Player 2 has #{@player2[:lives]} lives!".blue
  end
end

def start_game
  puts "WELCOME TO MATH HELL!".red

  if @player1[:name] == "Player 1" || @player2[:name] == "Player 2"
    add_names
  end

  while true
    question_generator(@player1)
    if @player1[:lives] == 0
      break
    end

    question_generator(@player2)
    if @player2[:lives] == 0
      break
    end
  end

  victory_ceremony
end

def victory_ceremony
  winner = @players.find do |player|
    player[:lives] != 0
  end
  puts "Congratulations #{winner[:name]}!".green
  puts "#{@player1[:name]}, your total score is #{@player1[:score]}. 
  #{@player2[:name]}, your total score is #{@player2[:score]}.".blue
  
  puts "Would you like to play another game?".blue
  response = gets.chomp
  if response == "yes"
    @player1[:lives] = 3
    @player2[:lives] = 3
    start_game
  end
end

def add_names
  puts "Player 1, what is your name?".blue
  @player1[:name] = gets.chomp
  puts "Player 2, what is your name?".blue
  @player2[:name] = gets.chomp
end

start_game