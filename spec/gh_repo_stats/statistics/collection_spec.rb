require "spec_helper"

module GhRepoStats
  module Statistics
    describe Collection do
      subject { described_class.new repos }

      let(:repo1) { double :repo1 }
      let(:repo2) { double :repo2 }
      let(:repos) { [ repo1, repo2 ]}

      describe "#size" do
        it "returns the repos' size" do
          expect(subject.size).to eq(2)
        end
      end
    end
  end
end
