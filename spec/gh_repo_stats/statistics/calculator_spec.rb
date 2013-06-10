require "spec_helper"

module GhRepoStats
  module Statistics
    describe Calculator do
      describe ".statistics" do
        let(:event1) { double :event1, repo_id: 12 }
        let(:event2) { double :event2, repo_id: 23 }
        let(:event3) { double :event3, repo_id: 12}
        let(:event4) { double :event4, repo_id: 23 }

        let(:result) { described_class.statistics([event1, event2, event3, event4])}

        it "returns a collection with 2 elements" do
          expect(result.size).to eq(2)
        end

      end
    end
  end
end
