require 'pp'
require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    puts "Please input the name for player 1:"
    @player1 = Player.new('white')
    @player1.name = gets.chomp
    puts "Plase input the name for player 2:" 
    @player2 = Player.new('black')
    @player2 = gets.chomp
    play(@player1)
  end

  def play(player)
    loop do
      puts "#{player.name}, what piece would you like to move?"
      piece_to_move = gets.chomp
      puts piece_to_move
      break if @board.can_move?(piece_to_move, player.color)

      puts 'Invalid Selection'
    end

    puts "Where would you like to move that piece to?"
    move_to = gets.chomp

    @board.move_piece(piece_to_move, move_to)
  end

end

Game.new