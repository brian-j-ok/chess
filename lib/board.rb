# frozen_string_literal: true
require 'colorize'
require 'pp'
require_relative 'piece'
require_relative 'movement'

# Board Class
class Board

  BOARD_LETTERS = [*('A'..'H')]
  BOARD_NUMS = (1..8).to_a

  def initialize
    @board_coord_hash = {}
    generate_board_hash
    draw_board
  end

  def draw_board
    puts '  _________________'
    BOARD_NUMS.each do |num|
      print "#{num} "
      BOARD_LETTERS.each do |letter|
        print "|#{grid_value(letter, num)}" unless grid_value(letter, num).nil?
      end
      print '|'
      puts
    end
    puts "   A B C D E F G H"
  end

  def grid_value(letter, num)
    black_grid = " ".colorize(:background => :black)
    white_grid = " ".colorize(:background => :white)
    return @board_coord_hash[letter + num.to_s].symbol unless @board_coord_hash[letter + num.to_s].nil?

    if num.odd?
      case letter
      when 'A', 'C', 'E', 'G'
        return black_grid
      else
        return white_grid
      end
    else
      case letter
      when 'A', 'C', 'E', 'G'
        return white_grid
      else
        return black_grid
      end
    end

    nil
  end

  def generate_board_hash
    BOARD_NUMS.each do |num|
      BOARD_LETTERS.each do |letter|
        case num
        when 1, 2
          @board_coord_hash[letter + num.to_s] = add_piece(letter, num, 'black')
        when 7, 8
          @board_coord_hash[letter + num.to_s] = add_piece(letter, num, 'white')
        else
          @board_coord_hash[letter + num.to_s] = nil
        end
      end
    end
    pp @board_coord_hash
  end

  def add_piece(letter, num, color)
    p "Letter: #{letter} Num: #{num} Color: #{color}"
    case num
    when 1, 8
      case letter
      when 'A', 'H'
        Piece.new('rook', color)
      when 'B', 'G'
        Piece.new('knight', color)
      when 'C', 'F'
        Piece.new('bishop', color)
      when 'D'
        Piece.new('queen', color)
      when 'E'
        Piece.new('king', color)
      end
    else
      Piece.new('pawn', color)
    end
  end

  # TODO: Implement logic to make sure that the selected piece has a possible, legal move and if not return false
  # CAN RESULT IN INFINITE LOOP WHERE PLAYER SELECTED PIECE WITH NO VALID MOVES
  def can_move?(piece_to_move, player_color)
    return false if @board_coord_hash[piece_to_move].nil? || @board_coord_hash[piece_to_move].color != player_color

    true
  end

  def valid_move?(piece_to_move, move_to_coords)
    return false if @board_coord_hash[piece_to_move].nil?

    piece = @board_coord_hash[piece_to_move]
    movement = Movement.new(piece, @board_coord_hash, piece_to_move, move_to_coords)
    movement.can_move?
  end

  def move_piece(piece_to_move, move_key)
    @board_coord_hash[move_key] = @board_coord_hash[piece_to_move]
    @board_coord_hash[piece_to_move] = nil

    draw_board
  end
end

Board.new