class RedditService
  # Service calls API

  # PORO calls Service


  def initialize
    @conn = Faraday.new("https://oauth.reddit.com")
    # current_user.token
  end



# /subreddits/mine/subscriber
  def subreddits

    @conn.get("/subreddits/mine/subscriber/")
  end



  # ["Authorization"] = "bearer #{current_user.token}"

end
