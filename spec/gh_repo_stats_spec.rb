require "spec_helper"

describe GhRepoStats do
  describe ".stats" do
    let(:options) { { "option" => "val" } }
    let(:results) { double :results }

    before(:each) do
      GhRepoStats::Retriever.stub(:retrieve_with).and_return results
      GhRepoStats::Reporter.stub(:report)
    end

    it "retrieves results" do
      GhRepoStats::Retriever.should_receive(:retrieve_with).with(options).and_return results
      GhRepoStats.stats options
    end

    it "outputs results" do
      GhRepoStats::Reporter.should_receive(:report).with(results)
      GhRepoStats.stats options
    end
  end
end
