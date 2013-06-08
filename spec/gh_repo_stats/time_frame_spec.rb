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

    describe "#later_than?" do
      context "when the time passed in is before the from time" do
        let(:time) { Time.new(2013, 04, 5, 12, 22, 33) }

        it "is later than the time" do
          expect(subject).to be_later_than(time)
        end
      end

      context "when the time passed in is equal to from time" do
        let(:time) { from }

        it "is not later than the time" do
          expect(subject).not_to be_later_than(time)
        end
      end

      context "when the time passed in is after the from time" do
        let(:time) { Time.new(2013, 04, 5, 12, 23, 19) }

        it "is not later than the time" do
          expect(subject).not_to be_later_than(time)
        end
      end

      context "when the time passed in is between the from time" do
        let(:time) { Time.new(2013, 04, 5, 12, 22, 34) }

        it "is not later than the time" do
          expect(subject).not_to be_later_than(time)
        end
      end

    end
  end
end
