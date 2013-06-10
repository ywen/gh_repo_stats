module GhRepoStats
  class LoaderParams
    attr_reader :options
    private :options

    def initialize(options)
      @options = options
    end

    def time_frame
      TimeFrame.new from, to
    end

    private

    def to
      before_from_options || Time.now
    end

    def from
      after_from_options || Time.now-60
    end

    def before_from_options
      time_from_option "before"
    end

    def after_from_options
      time_from_option "after"
    end

    def time_from_option(option_name)
      options[option_name] && Time.parse(options[option_name])
    end
  end
end
