require 'octokit'

module GhRepoStats
  class EventLoader
    class << self
      def load(event_type, time_frame)
        result = []
        response = Octokit.public_events
        response.each do |content_hash|
          event = Event.new content_hash
          if time_frame.include?(event.created_at) && event_type.matches?(event.type)
            result << event
          end
        end
        result
      end
    end
  end
end
