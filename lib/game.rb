require 'pp'
require_relative 'board'
require_relative 'player'

# Handles Game Logic
class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    puts "Please input the name for player 1:"
    @player1 = Player.new('white')
    @player1.name = gets.chomp
    puts "Plase input the name for player 2:" 
    @player2 = Player.new('black')
    @player2.name = gets.chomp
    @turn = true
    start_game
  end

  def start_game
    loop do
      if @turn
        play(@player1)
      else
        play(@player2)
        @turn = true
      end
    end
  end

  def play(player)
    piece_to_move = nil
    move_to = nil
    loop do
      puts "#{player.name}, what piece would you like to move?"
      piece_to_move = gets.chomp
      break if @board.can_move?(piece_to_move, player.color)

      puts 'Invalid Selection'
    end

    loop do
      puts "Where would you like to move that piece to?"
      move_to = gets.chomp
      break if @board.valid_move?(piece_to_move, move_to)

      puts 'Invalid Selection'
    end

    @board.move_piece(piece_to_move, move_to)
  end
end

Game.new