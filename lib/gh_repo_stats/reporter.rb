module GhRepoStats
  class Reporter
    class << self
      def report(results, command_params)
        results.sorted_results.each_with_index do |result, i|
          break unless command_params.count > i
          puts "#{result.repo_name} - #{result.count} events"
        end
      end
    end
  end
end
