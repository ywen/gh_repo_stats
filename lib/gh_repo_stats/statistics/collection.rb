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
    end
  end
end
