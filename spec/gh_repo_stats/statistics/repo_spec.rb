require "spec_helper"

module GhRepoStats
  module Statistics
    describe Repo do
      subject { described_class.new [ event1, event2 ] }

      let(:event1) { double :event1, repo_name: "name" }
      let(:event2) { double :event2 }

      describe "#count" do
        it "returns the size of events" do
          expect(subject.count).to eq(2)
        end
      end

      describe "#repo_name" do
        it "returns repo_name" do
          expect(subject.repo_name).to eq("name")
        end
      end
    end
  end
end
