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
    draw_board
  end

  def draw_board
    generate_board_hash
    puts '  _________________'
    BOARD_NUMS.each do |num|
      print "#{num} "
      BOARD_LETTERS.each do |letter|
        print "|#{grid_value(letter, num)}" unless grid_value(letter, num).nil?
      end
      print '|'
      puts
    end
      # if num.odd?
      #   puts "#{num} |#{white_grid}|#{black_grid}|#{white_grid}|#{black_grid}|#{white_grid}|#{black_grid}|#{white_grid}|#{black_grid}|"
      # else
      #   puts "#{num} |#{black_grid}|#{white_grid}|#{black_grid}|#{white_grid}|#{black_grid}|#{white_grid}|#{black_grid}|#{white_grid}|"
      # end
  end

  def grid_value(letter, num)
    black_grid = " ".colorize(:background => :black)
    white_grid = " ".colorize(:color => :black, :background => :white)
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
