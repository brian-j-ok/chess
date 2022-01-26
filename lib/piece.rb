# frozen_string_literal: true

class Piece
  attr_accessor :type, :symbol, :color

  def initialize(type = 'pawn', color = 'white')
    @type = type
    @color = color
    set_symbol
  end

  # TODO: Rewrite using ternary operator to reduce lines of code
  # TODO: Look into using a array to store unicode values
  def set_symbol
    case @type
    when 'pawn'
      @color == 'white' ? @symbol = "\u2659".encode('utf-8') : @symbol = "\u265F".encode('utf-8')
      # @symbol = "\u2659".encode('utf-8') if @color == 'white'
      # @symbol = "\u265F".encode('utf-8') if @color == 'black'
    when 'knight'
      @symbol = "\u2658".encode('utf-8') if @color == 'white'
      @symbol = "\u265E".encode('utf-8') if @color == 'black'
    when 'bishop'
      @symbol = "\u2657".encode('utf-8') if @color == 'white'
      @symbol = "\u265D".encode('utf-8') if @color == 'black'
    when 'rook'
      @symbol = "\u2657".encode('utf-8') if @color == 'white'
      @symbol = "\u265C".encode('utf-8') if @color == 'black'
    when 'queen'
      @symbol = "\u2655".encode('utf-8') if @color == 'white'
      @symbol = "\u265B".encode('utf-8') if @color == 'black'
    when 'king'
      @symbol = "\u2654".encode('utf-8') if @color == 'white'
      @symbol = "\u265A".encode('utf-8') if @color == 'black'
    else
      puts 'Error: No accessible piece type found'
    end
  end

  def to_s
    @symbol
  end
end