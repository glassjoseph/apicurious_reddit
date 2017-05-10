require 'rails_helper'


describe User do
  context "user attributes" do
    it "returns user's info" do
      users = [User.create(uid: "asdlfjl", name: "james", link_karma: 20, comment_karma: 10, token: "test_token234234", token_expiration: 1494376745)]
      allow_any_instance_of(RedditService).to receive(:users).and_return(users)

      user = RedditService.users.first

      expect(user.uid).to eq("asdlfjl")
      expect(user.name).to eq("james")
      expect(user.link_karma).to eq(20)
      expect(user.comment_karma).to eq(10)
      expect(user.token).to be(String)
      expect(user.token_expiration).to be(Integer)
    end

    it "has a token and token_expiration" do
      # user = RedditService.user
    end

  end
end


#User id: 4, uid: "13lk97", name: "evocomp", token: "tXaEK8M98tQ-AUny399S83y1yV4", token_expiration: 1494376745, link_karma: 37, comment_karma: 1, created_at: "2017-05-09 23:39:05", updated_at: "2017-05-09 23:40:10"]
