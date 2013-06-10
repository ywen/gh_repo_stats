require "spec_helper"

module GhRepoStats
  describe Reporter do
    describe ".report" do
      let(:results) { double :results, sorted_results: [result1, result2, result3] }
      let(:result1) { double :result1, repo_name: "name1", count: 12 }
      let(:result2) { double :result2, repo_name: "name2", count: 10 }
      let(:result3) { double :result3 }
      let(:command_params) { double :command_params, count: 2 }

      it "outputs 2 results" do
        result3.should_not_receive(:repo_name)
        described_class.report results, command_params
      end
    end
  end
end
