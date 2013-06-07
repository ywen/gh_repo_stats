module GhRepoStats
  class EventType
    attr_reader :name
    def initialize(name)
      @name = name
    end

    def matched?(type)
      type == name
    end
  end
end
