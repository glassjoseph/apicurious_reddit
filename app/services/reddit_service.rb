class RedditService
  # Service calls API

  # PORO calls Service


  def initialize
    @conn = Faraday.new("https://oauth.reddit.com")
    # current_user.token
  end



# /subreddits/mine/subscriber
#user.subreddits?
  def self.subreddits
    @conn.headers["Authorization"] = "bearer #{current_user.token}"
    response = @conn.get("/subreddits/mine/subscriber/")
    response = JSON.parse(response.body, symbolize_names: true)
    response[:data][:children].each do |subreddit|
      name = subreddit[:data][:display_name]
      description = subreddit[:data][:description]
    end
  end



    #Make a model?




  # ["Authorization"] = "bearer #{current_user.token}"

  # Do we create subreddit model? I think so. Then we can make user.subreddits has_many

end
#response[:data][:children].first[:data].  /:description :display_name
