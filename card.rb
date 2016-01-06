class Card
  attr_accessor :card_visible, :value, :revealed

  def initialize (value)
    @revealed = false
    @value = value
  end

  def hide
    @revealed = false
  end

  def reveal(pos)
    @revealed = true
  end

  def to_s
  end

  def ==(other_card)
    self == other_card
  end

end
