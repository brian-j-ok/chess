# frozen_string_literal: true
require_relative 'piece'

# Movement class for all piece types
class Movement
  BOARD_LETTERS_NUM_VALUE = {'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8}

  def initialize(piece, board_hash, start_coords, end_coords)
    @piece = piece
    @board_hash = board_hash
    @start_coords = [BOARD_LETTERS_NUM_VALUE[start_coords[0, 1]], start_coords[1, 2].to_i]
    @move = end_coords
    @end_coords = [BOARD_LETTERS_NUM_VALUE[end_coords[0, 1]], end_coords[1, 2].to_i]
  end

  def can_move?
    case @piece.type
    when 'pawn'
      @piece.color == 'white' ? @movement_array = [[0, -1], [0, -2]] : @movement_array = [[0, 1], [0, 2]]
      pawn_move
    when 'knight'
      @movement_array = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
      knight_move
    when 'bishop'

    when 'rook'

    when 'queen'

    when 'king'

    else
      puts 'Error: No accessible piece type found'
    end
  end

  def pawn_move
    moved_coords = [@start_coords[0] + @movement_array[0][0], @start_coords[1] + @movement_array[0][1]]
    moved_coords == @end_coords
  end

  # Method checks all possible moves and sees if any land on the desired input coord
  # If the spot is nil, or contains a opponents piece it returns true
  def knight_move
    moved_coords = @start_coords
    @movement_array.each do |coord|
      moved_coords = [@start_coords[0] + coord[0], @start_coords[1] + coord[1]]
      if moved_coords == @end_coords
        if @board_hash[@move].nil? || @board_hash[@move].color != @piece.color
          return true
        end
      end
    end
    false
  end
end
