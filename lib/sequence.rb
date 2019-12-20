require_relative "groups"

class Sequence
  using Groups

  def initialize(str)
    @digits = str.chars
  end

  def next
    new_digits = @digits.consecutive_eql_groups
                        .flat_map { |g| [g.length, g.first] }
    Sequence.new new_digits.join
  end

  def to_s
    @digits.join
  end
end
