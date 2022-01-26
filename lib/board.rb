# frozen_string_literal: true
require 'colorize'
require 'pp'
require_relative 'piece'

# Board Class
class Board

  BOARD_LETTERS = [*('A'..'G')]
  BOARD_NUMS = (1..8).to_a

  def initialize
    @board_coord_hash = {}
    create_board
  end

  def create_board
    generate_board_hash
  end

  def generate_board_hash
    BOARD_LETTERS.each do |letter|
      BOARD_NUMS.each do |num|
        case num
        when 1, 2
          @board_coord_hash[letter + num.to_s] = add_piece(letter, num, 'white')
        when 7, 8
          @board_coord_hash[letter + num.to_s] = add_piece(letter, num, 'black')
        else
          @board_coord_hash[letter + num.to_s] = nil
        end
      end
    end
    pp @board_coord_hash
  end

  def add_piece(letter, num, color)
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
end

Board.new
