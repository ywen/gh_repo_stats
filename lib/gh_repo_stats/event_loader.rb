require 'yajl'
require 'httparty'
module GhRepoStats
  class EventLoader
    class << self
      def load(event_type, time_frame)
        result = []
        response = HTTParty.get(event_url)
        response_hash = Yajl::Parser.parse response.body, symbolize_keys: true
        response_hash.each do |content_hash|
          event = Event.new content_hash
          if time_frame.include?(event.created_at) && event_type.matches?(event.type)
            result << event
          end
        end
        result
      end

      private

      def event_url
        "https://api.github.com/events"
      end
    end
  end
end
