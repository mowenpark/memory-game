require 'set'
require 'byebug'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(4) {Array.new(4)}
  end

  def populate
    possible_values = Set.new(1..8)

    while @grid.flatten.any? { |el| el.nil? }
      possible_values.each do |value|
        2.times do
          pos = [rand(4),rand(4)]
          # debugger
          self[pos].nil? ? self[pos] = Card.new(value) : redo
          # self.[]= (Card.new)
        end
      end
    end
  end

  def reveal(guessed_pos)
    card = self[guessed_pos]
    if card.revealed
      return false
    else
      card.reveal(guessed_pos)
      return card.value
    end
  end

  def render
    system("clear")
    header  = "| 0 | 1 | 2 | 3 |"
    line    = "|---|---|---|---|"
    puts "#{header}\n#{line}"
    @grid.each_index do |i|
      puts "#{display_row(i)}"
      puts "#{line}" if i < (@grid.count - 1)
    end
    #sleep(3)
  end

  def display_row(index)
    row_values = []
    # debugger
    @grid[index].each do |card|
      card.revealed ? row_values << card.value : row_values << "X"
    end

    "| #{row_values[0]} | #{row_values[1]} | #{row_values[2]} | #{row_values[3]} |"
  end

  def won?
    # debugger
    # @grid.all?(&:revealed)
    @grid.flatten.all? { |card| card.revealed == true }
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  # def full?
  #   return false if @grid.flatten.any? { |el| el.nil? }
  # end

end
