require 'rails_helper'


descrie User do
  context "user attributes" do
    it "returns user's name and karma" do
      user = RedditService.user

      expect(user.uid).to eq("13lk97")
      expect(user.name).to eq("evocomp")
      expect(user.link_karma).to eq(37)
      expect(user.comment_karma).to eq(1)
    end

    it "has a token and token_expiration" do
      user = RedditService.user

      expect(user.token).to be(String)
      expect(user.token_expiration).to be(Integer)
    end

  end
end
