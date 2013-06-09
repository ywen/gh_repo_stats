module GhRepoStats
  module Statistics
    class Repo
      #all the event that belongs to the same repo
      def initialize(events)
        @events = events
      end
    end
  end
end
