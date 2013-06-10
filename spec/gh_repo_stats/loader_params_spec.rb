require "spec_helper"

module GhRepoStats
  describe LoaderParams do
    subject { described_class.new options }

    let(:options) { {} }

    describe "#time_frame" do
      let(:result) { subject.time_frame }

      context "when before is passed in" do
        let(:time_str) { "2012-11-01T13:00:00Z" }
        let(:options) { { "before" => time_str } }

        it "sets time frame 'to' to this time" do
          expect(result.to).to eq(Time.parse(time_str))
        end
      end

      context "when before is not passed in" do
        it "sets time frame 'to' to Time.now" do
          expect(result.to).to be_within(5).of(Time.now)
        end
      end

      context "when after is passed in" do
        let(:time_str) { "2012-11-01T13:00:00Z" }
        let(:options) { { "after" => time_str } }

        it "sets time frame 'from' to this time" do
          expect(result.from).to eq(Time.parse(time_str))
        end
      end

      context "when after is not passed in" do
        it "sets time frame 'from' to Time.now - 1 minute" do
          expect(result.from).to be_within(5).of(Time.now - 60)
        end
      end
    end

    describe "#event_type" do
      let(:result) { subject.event_type }

      context "when passed in" do
        let(:options) { { "event" => "CreateEvent" } }

        it "returns it" do
          expect(result.name).to eq("CreateEvent")
        end
      end

      context "when not passed in" do

        it "returns PushEvent as default" do
          expect(result.name).to eq("PushEvent")
        end
      end
    end
  end
end
