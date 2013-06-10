module GhRepoStats
  module Statistics
    class Collection
      attr_reader :repos
      private :repos
      def initialize(repos)
        @repos = repos
      end

      def size
        repos.size
      end

      def sorted_results
        repos.sort {|a, b| b.count <=> a.count }
      end
    end
  end
end
