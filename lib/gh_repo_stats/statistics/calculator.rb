module GhRepoStats
  module Statistics
    module Calculator
      class << self
        def statistics(events)
          result = []
          p events
          events.group_by(&:repo_id).map do |repo_id, events|
            result << Repo.new(events)
          end
          Collection.new result
        end
      end
    end
  end
end
