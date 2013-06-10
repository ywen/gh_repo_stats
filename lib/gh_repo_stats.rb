require 'time'
Dir["#{File.dirname(__FILE__)}/gh_repo_stats/**/*.rb"].each do |f| 
  require f
end

module GhRepoStats
  class << self
    def stats(options)
      command_params = CommandParams.new options
      events = EventLoader.load command_params.event_type, command_params.time_frame
      results = Statistics::Calculator.statistics(events)
      Reporter.report(results, command_params)
    end
  end
end
