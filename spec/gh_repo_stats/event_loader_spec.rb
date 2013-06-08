require "spec_helper"

module GhRepoStats
  describe EventLoader do
    let(:event_name) { "PushEvent" }
    let(:event_type) { EventType.new event_name }
    let(:after_time) { Time.new(2013, 3, 12, 11, 13, 34, 0) }
    let(:before_time) { Time.new(2013, 3, 13, 10, 16, 34, 0) }
    let(:time_frame) { TimeFrame.new after_time, before_time }

    let(:raw_response1) {
      [
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
            created_at: "2013-03-12T12:03:52Z"
          },
        {
              id: "1752899727",
              type: "GollumEvent",
              actor: {
                    id: 1620893,
                    login: "KptainO",
                    gravatar_id: "59c495b83be2e8d5f3c2a9541bb749b8",
                    url: "https://api.github.com/users/KptainO",
                    avatar_url: "https://secure.gravatar.com/avatar/59c495b83be2e8d5f3c2a9541bb749b8?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"
                  },
              repo: {
                        id: 9205196,
                        name: "KptainO/Wiggly",
                        url: "https://api.github.com/repos/KptainO/Wiggly"
                      },
              payload: {
                            pages: [
                                    {
                                              page_name: "Playing with your route",
                                              title: "Playing with your route",
                                              summary: nil,
                                              action: "created",
                                              sha: "ea19c64fbdf0436e127b78987b15ca2538cd9a1e",
                                              html_url: "https://github.com/KptainO/Wiggly/wiki/Playing-with-your-route"
                                            }
                                  ]
                          },
              public: true,
              created_at: "2013-06-07T23:03:50Z"
            }]
    }

    describe ".load" do
      let(:result) { described_class.load event_type, time_frame }

      before(:each) do
        Octokit.stub(:public_events).with(page: 1).and_return raw_response1
      end

      it "puts the one matches the event type and falls into time slot into the return" do
        expect(result.size).to eq(1)
        expect(result[0].id).to eq('1752899736')
      end
    end
  end
end
