require 'octokit'

module GhRepoStats
  class EventLoader
    class << self
      def load(event_type, time_frame)
        page = 1
        result = []
        response = Octokit.public_events(page: page)
        while(has_next?(response, time_frame))
          response.each do |content_hash|
            event = Event.new content_hash
            if time_frame.include?(event.created_at) && event_type.matches?(event.type)
              result << event
            end
          end
          page += 1
          response = Octokit.public_events(page: page)
        end
        result
      end

      private

      # Assuming the events API returns events order by
      # created at time in DESC
      def has_next?(response, time_frame)
      end
    end
  end
end
