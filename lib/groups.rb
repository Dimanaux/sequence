module Groups
  refine Array do
    def consecutive_eql_groups
      groups = []
      each { |element| groups.group!(element) }
      groups
    end

    def group!(element)
      if element.belongs? last_group
        last_group.append(element)
      else
        append_new_group(element)
      end
    end

    def append_new_group(element)
      push([element])
    end

    def last_group
      last
    end
  end

  refine Object do
    def belongs?(enum)
      enum && enum.include?(self)
    end
  end
end
