module GhRepoStats
  module Statistics
    class Repo
      attr_reader :events
      #all the event that belongs to the same repo
      def initialize(events)
        @events = events
      end

      def count
        events.size
      end
    end
  end
end
