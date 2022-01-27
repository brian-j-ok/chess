# frozen_string_literal: true

class Piece
  attr_accessor :type, :symbol, :color

  def initialize(type = 'pawn', color = 'white')
    @type = type
    @color = color
    p @color
    set_symbol
    @has_moved = false
  end

  # TODO: Rewrite using ternary operator to reduce lines of code
  # TODO: Look into using a array to store unicode values
  # DUE TO TEXT COLOR AND BACKGROUND OF TERMINAL, WHITE PIECES APPEAR AS BLACK AND BLACK PIECES APPEAR AS WHITE (WHITE FONT)
  # AS SUCH, THEY ARE OPPOSITE TO WHAT THEY SHOULD BE (WHITE PIECE == BLACK PIECE UNICODE)
  def set_symbol
    case @type
    when 'pawn'
      @color != 'white' ? @symbol = "\u2659".encode('utf-8') : @symbol = "\u265F".encode('utf-8') 
      # @symbol = "\u2659".encode('utf-8') if @color == 'white'
      # @symbol = "\u265F".encode('utf-8') if @color == 'black'
    when 'knight'
      @color != 'white' ? @symbol = "\u2658".encode('utf-8') : @symbol = "\u265E".encode('utf-8')
    when 'bishop'
      @color != 'white' ? @symbol = "\u2657".encode('utf-8') : @symbol = "\u265D".encode('utf-8')
    when 'rook'
      @color != 'white' ? @symbol = "\u2657".encode('utf-8') : @symbol = "\u265C".encode('utf-8')
    when 'queen'
      @color != 'white' ? @symbol = "\u2655".encode('utf-8') : @symbol = "\u265B".encode('utf-8')
    when 'king'
      @color != 'white' ? @symbol = "\u2654".encode('utf-8') : @symbol = "\u265A".encode('utf-8')
    else
      puts 'Error: No accessible piece type found'
    end
  end

  def had_moved?
    return false if !@has_moved
    
    @has_moved = true
  end
  
  def to_s
    @symbol
  end
end
