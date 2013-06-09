require "spec_helper"

module GhRepoStats
  module Statistics
    describe Calculator do
      describe ".statistics" do
        let(:event1) { double :event1 }
        let(:event2) { double :event2 }
        let(:event3) { double :event2 }
        let(:event4) { double :event2 }

        let(:result) { described_class.statistics([event1, event2, event3, event4])}
      end
    end
  end
end
