module GhRepoStats
  class Event
    attr_reader :content_hash
    private :content_hash

    def initialize(content_hash)
      @content_hash = content_hash
    end

    def id
      content_hash[:id]
    end

    def created_at
      Time.parse content_hash[:created_at]
    end
  end
end
