require 'octokit'

module GhRepoStats
  class EventLoader
    class << self
      def load(event_type, time_frame)
        result = []
        (1..Float::INFINITY).each do |page|
          response = Octokit.public_events(page: page)
          break if response.empty?
          events = response.map{|r| Event.new(r) }
          events.each do |event|
            if time_frame.include?(event.created_at) && event_type.matches?(event.type)
              result << event
            end
          end
          break if no_more_page_needed?(events.last, time_frame)
        end
        result
      end

      private

      # Assuming the events API returns events order by
      # created at time in DESC
      def no_more_page_needed?(event, time_frame)
        time_frame.later_than?(event.created_at)
      end
    end
  end
end
