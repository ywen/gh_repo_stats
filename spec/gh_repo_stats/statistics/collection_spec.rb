require "spec_helper"

module GhRepoStats
  module Statistics
    describe Collection do
      subject { described_class.new repos }

      let(:repo1) { double :repo1, count: 12 }
      let(:repo2) { double :repo2, count: 20 }
      let(:repos) { [ repo1, repo2 ]}

      describe "#size" do
        it "returns the repos' size" do
          expect(subject.size).to eq(2)
        end
      end

      describe "#sorted_results" do
        it "returns repos in sorted order by count" do
          expect(subject.sorted_results).to eq([repo2, repo1])
        end
      end
    end
  end
end
