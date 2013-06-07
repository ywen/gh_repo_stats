require "spec_helper"

module GhRepoStats
  describe EventType do
    subject { described_class.new name }

    let(:name) { "PushEvent" }

    describe "#matched?" do
      context "the type is the same" do
        it "matches" do
          expect(subject).to be_matched(name)
        end
      end

      context "the type is not the same" do
        it "does not matches" do
          expect(subject).not_to be_matched("some other type")
        end
      end
    end
  end
end
