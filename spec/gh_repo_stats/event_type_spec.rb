require "spec_helper"

module GhRepoStats
  describe EventType do
    subject { described_class.new name }

    let(:name) { "PushEvent" }

    describe "#matched?" do
      context "the type is the same" do
        it "matches" do
          expect(subject).to be_matches(name)
        end
      end

      context "the type is not the same" do
        it "does not match" do
          expect(subject).not_to be_matches("some other type")
        end
      end
    end
  end
end
