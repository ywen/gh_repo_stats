require 'time'
Dir["#{File.dirname(__FILE__)}/gh_repo_stats/**/*.rb"].each do |f| 
  require f
end

module GhRepoStats
  class << self
    def stats(options)
      results = Retriever.retrieve_with options
      Reporter.report(results)
    end
  end
end
