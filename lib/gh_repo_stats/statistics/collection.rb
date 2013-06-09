module GhRepoStats
  module Statistics
    class Collection
      attr_reader :repos
      private :repos
      def initialize(repos)
        @repos = repos
      end
    end
  end
end
