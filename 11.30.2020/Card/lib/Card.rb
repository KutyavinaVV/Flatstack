class Card
  @@ranks= {
    jack: 11,
    queen: 12,
    king: 13,
    ace: 14
  }


  def initialize(rank:, suit:)
    @rank = define_rank(rank)
    @suit = suit
  end

  def rank
    @rank
  end

  def suit
    @suit
  end

  def ==(card)
    self.rank == card.rank && self.suit == card.suit
  end

  def >(card)
    self.rank > card.rank
  end

  def print
    r = if (rank < 11) && (rank > 1)
          @rank
        else
          @@ranks.key(@rank).to_s.capitalize
        end
    puts(r)
    "#{r} #{self.suit.capitalize}"
  end

  private
  def define_rank(rank)
    @rank = if @@ranks.include?(rank)
              @@ranks[rank]
            elsif (rank <  11) && (rank > 1)
              rank
            else
              raise(ArgumentError.new("Illigal rank"))
            end
  end
end

card = Card.new(rank: :jack, suit: :hearts)

