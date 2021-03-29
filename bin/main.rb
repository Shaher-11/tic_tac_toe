#!/usr/bin/env ruby
require_relative('../lib/player')
require_relative('../lib/board')
require_relative('../lib/logic')

class Game
  include Logic
  def initialize
    @player1_trn = []
    @player2_trn = []
    @winning_options = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    @tak_turns = []
    @win = false
  end

  def greeting
    puts "Welcome to Ruby's tic tac toe \u{1F600}"
    puts
    puts 'Enter first player name:'
    @player1 = gets.chomp.capitalize
    until Board.validate_name(@player1)
      puts 'Name is too short, please try again'
      @player1 = gets.chomp.capitalize
    end
    puts 'Enter second player name:'
    @player2 = gets.chomp.capitalize
    until Board.validate_name(@player2)
      puts 'Name is too short,please try again'
      @player2 = gets.chomp.capitalize
    end
    @star = "\u{2B50}"
    @droplet = "\u{1F4A7}"
    @first_player = Player.new(@player1, @star)
    @second_player = Player.new(@player2, @droplet)
    @my_array = Board.new(@first_player, @second_player).my_array
    puts
    puts "#{@first_player.name} will play with #{@first_player.sign}
and #{@second_player.name} will play with #{@second_player.sign}"
    puts
    puts "#{@first_player.name}(#{@first_player.sign}) -- VS -- #{@second_player.name}(#{@second_player.sign}) \n"
    puts
    puts
    puts "Let's Start!"
    puts
  end

  def board
    puts '+----+------+-----+-----+'
    puts "|   #{@my_array[0]}   |   #{@my_array[1]}   |   #{@my_array[2]}   "
    puts '+----+------+-----+-----+'
    puts "|   #{@my_array[3]}   |   #{@my_array[4]}   |   #{@my_array[5]}   "
    puts '+----+------+-----+-----+'
    puts "|   #{@my_array[6]}   |   #{@my_array[7]}   |   #{@my_array[8]}   "
    puts '+----+------+-----+-----+'
    @my_array
  end

  def draw
    puts "#{@first_player.name} & #{@second_player.name} Draw"
  end

  def player1_wins
    puts "The Winner is #{@first_player.name}(#{@first_player.sign}) \u{1f973} \u{1F389} \n"
    puts "Good luck next time #{@second_player.name} (#{@second_player.sign}) \u{1f609}"
  end

  def player2_wins
    puts "The Winner is #{@second_player.name} (#{@second_player.sign}) \u{1f973} \u{1F389} \n"
    puts "Good luck next time #{@first_player.name} (#{@first_player.sign}) \u{1f609}"
  end

  def player1_turn
    puts "It is #{@player1}'s turn"
    puts
    puts 'Please select an available cell number'
    loop do
      player1_num = gets.chomp
      @player1_trn << player1_num.to_i if test_move(player1_num) == true
      puts 'Invalid move! Please pick a number between 1 & 9:' if test_move(player1_num) == false
      next unless test_move(player1_num) == true

      target = @my_array.find { |el| el == player1_num.to_i }
      @my_array[target - 1] = @first_player.sign
      board
      break
    end
  end

  def player2_turn
    puts "It is #{@player2}'s turn"
    puts
    puts 'Please select an available cell number'
    loop do
      player2_num = gets.chomp
      @player2_trn << player2_num.to_i if test_move(player2_num) == true
      puts 'Invalid move! Please pick a number between 1 & 9:' if test_move(player2_num) == false
      next unless test_move(player2_num) == true

      target = @my_array.find { |el| el == player2_num.to_i }
      @my_array[target - 1] = @second_player.sign
      board
      break
    end
  end

  def going
    c = 0
    until c > 9
      player1_turn
      calc_tak_turns
      c += 1
      wining
      break if c == 9 || @win == true

      player2_turn
      calc_tak_turns
      c += 1
      wining
      break if @win == true
    end
    draw unless @win == true
    board
  end

  def play
    greeting
    board
    going
  end
end
game = Game.new
game.play

class Calculator
  def add(z, x)
    z + x
  end
end