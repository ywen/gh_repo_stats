require "spec_helper"

describe GhRepoStats do
  describe ".stats" do
    let(:options) { { "option" => "val" } }
    let(:events) { double :events }
    let(:results) { double :results }

    before(:each) do
      GhRepoStats::Retriever.stub(:retrieve_with).and_return events
      GhRepoStats::Reporter.stub(:report)
      GhRepoStats::Statistics::Calculator.stub(:statistics).and_return results
    end

    it "retrieves results" do
      GhRepoStats::Retriever.should_receive(:retrieve_with).with(options).and_return events
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
