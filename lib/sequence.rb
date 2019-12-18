class Sequence
  def initialize(str)
    @digits = str.chars
  end

  def next
    new_digits = @digits.group.flat_map { |g| [g.length, g.first] }
    Sequence.new new_digits.join
  end

  def to_s
    @digits.join
  end
end

class Array
  def group
    groups = []
    each do |element|
      if groups.last && element == groups.last.first
        groups.last << element
      else
        groups << [element]
      end
    end
    groups
  end
end
