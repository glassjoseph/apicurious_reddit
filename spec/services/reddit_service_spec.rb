require 'rails_helper'

describe RedditService do
  context "subreddits" do
    it "returns all of a users subreddits" do

      #consider moving to user?
      VCR.use_cassette("users_subreddits") do
        subreddits = RedditService.subreddits
        subreddit = subreddits.first

        expect(subreddits).to be_an(Array)
        expect(subreddit).to be_a(Hash)
        expect(subreddit).to have_key(:display_name)
        expect(subreddit).to have_key(:description)
        expect(subreddit[:display_name]).to be_a(String)
        expect(subreddit[:description]).to be_a(String)
      end
    end
  end
end
