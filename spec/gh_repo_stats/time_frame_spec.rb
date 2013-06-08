require "spec_helper"

module GhRepoStats
  describe TimeFrame do
    subject { described_class.new from, to }

    let(:from) { Time.new(2013, 04, 5, 12, 22, 34) }
    let(:to) { Time.new(2013, 04, 5, 12, 23, 18) }

    describe "#include?" do
      context "when the time passed in is before the from time" do
        let(:time) { Time.new(2013, 04, 5, 12, 22, 33) }

        it "does not include it" do
          expect(subject).not_to include(time)
        end
      end

      context "when the time passed in is after the from time" do
        let(:time) { Time.new(2013, 04, 5, 12, 23, 19) }

        it "does not include it" do
          expect(subject).not_to include(time)
        end
      end

      context "when the time passed in is between the from time" do
        let(:time) { Time.new(2013, 04, 5, 12, 22, 34) }

        it "does not include it" do
          expect(subject).to include(time)
        end
      end
    end
  end
end
