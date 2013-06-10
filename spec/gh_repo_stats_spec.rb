require "spec_helper"

describe GhRepoStats do
  describe ".stats" do
    let(:options) { { "option" => "val" } }
    let(:events) { double :events }
    let(:event_type) { double :event_type }
    let(:time_frame) { double :time_frame }
    let(:command_params) { double :command_params, event_type: event_type, time_frame: time_frame }
    let(:results) { double :results }

    before(:each) do
      GhRepoStats::CommandParams.stub(:new).and_return command_params
      GhRepoStats::EventLoader.stub(:load).and_return events
      GhRepoStats::Reporter.stub(:report)
      GhRepoStats::Statistics::Calculator.stub(:statistics).and_return results
    end

    it "retrieves results" do
      GhRepoStats::EventLoader.should_receive(:load).with(event_type, time_frame).and_return events
      GhRepoStats.stats options
    end

    it "calculate the statistics" do
      GhRepoStats::Statistics::Calculator.should_receive(:statistics).with(events).and_return results
      GhRepoStats.stats options
    end

    it "outputs results" do
      GhRepoStats::Reporter.should_receive(:report).with(results)
      GhRepoStats.stats options
    end
  end
end
