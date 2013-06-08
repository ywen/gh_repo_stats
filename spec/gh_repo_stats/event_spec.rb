require "spec_helper"

module GhRepoStats
  describe Event do
    subject { described_class.new content_hash}

    let(:content_hash) {
      {
        id: "1752899736",
        type: "PushEvent",
        actor: {
          id: 956069,
          login: "stricaud",
          gravatar_id: "f1794166b9bb8939e87e1018911ea142",
          url: "https://api.github.com/users/stricaud",
          avatar_url: "https://secure.gravatar.com/avatar/f1794166b9bb8939e87e1018911ea142?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"
        },
        repo: {
          id: 3810347,
          name: "stricaud/gvgen",
          url: "https://api.github.com/repos/stricaud/gvgen"
        },
        payload: {
          push_id: 185702039,
          size: 1,
          distinct_size: 1,
          ref: "refs/heads/master",
          head: "777ab0669e046d160ed6780538f9c1a492f251d7",
          before: "b1c95642b551003e9c504cd7f86a800de354a783",
          commits: [
            {
              sha: "777ab0669e046d160ed6780538f9c1a492f251d7",
              author: {
                email: "sebastien@honeynet.org",
                name: "Sebastien Tricaud"
              },
              message: "Add some documentation",
              distinct: true,
              url: "https://api.github.com/repos/stricaud/gvgen/commits/777ab0669e046d160ed6780538f9c1a492f251d7"
            }
          ]
        },
        public: true,
        created_at: "2013-06-07T23:03:52Z"
      }
    }

    describe "#id" do
      it "returns id" do
        expect(subject.id).to eq("1752899736")
      end
    end

    describe "#created_at" do
      it "returns created_at time" do
        expect(subject.created_at).to eq(Time.parse("2013-06-07T23:03:52Z"))
      end
    end

    describe "#type" do
      it "returns type" do
        expect(subject.type).to eq("PushEvent")
      end
    end
  end
end

