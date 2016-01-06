class HumanPlayer

  def initialize(name)
    @name = name
  end

  def get_input
    STDIN.gets.chomp
  end

end

class ComputerPlayer

  def initialize
    @already_matched  = []
    @known_cards      = {}
    @potential_guesses = []
    @previous_guess   = nil
  end

  def get_input
    @previous_guess ? second_guess : first_guess
  end

  # def valid_guess
  #
  # end

  def first_guess
    # known_match || random_guess
    @previous_guess = "#{rand(4)},#{rand(4)}"
  end

  def second_guess
    # match_previous || random_guess
    sec_guess = nil
    unless sec_guess == @previous_guess
      sec_guess = "#{rand(4)},#{rand(4)}"
    end
    @previous_guess = nil
    return sec_guess
  end

end
