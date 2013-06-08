module GhRepoStats
  class TimeFrame
    attr_reader :from, :to
    private :from, :to

    def initialize(from, to)
      @from, @to = from, to
    end

    def include?(time)
      from <= time && to >= time
    end

    def later_than?(time)
      from > time
    end
  end
end
