require "spec_helper"
load File.join(File.expand_path(__dir__), "..", "..", "bin", "gh_repo_stats")

describe 'GhRepoStatsBin' do
  describe "default task" do
    let(:options) { { "after" => "value" } }

    it "calls the get command" do
      GhRepoStats.should_receive(:stats).with(options)
      GhRepoStatsBin.start(["--after", "value"])
    end
  end
end
