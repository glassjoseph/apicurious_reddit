class RedditService
  # Service calls API

  # PORO calls Service


  def initialize
    # @conn = Faraday.new("https://oauth.reddit.com")
    # user.token
  end



# /subreddits/mine/subscriber
#user.subreddits?
  def self.user_subreddits(user)
    @conn = Faraday.new("https://oauth.reddit.com")
    @conn.headers["Authorization"] = "bearer #{user.token}"
    response = @conn.get("/subreddits/mine/subscriber/") #.json?
    response = JSON.parse(response.body, symbolize_names: true)
    response[:data][:children].each do |subreddit|
      display_name = subreddit[:data][:display_name]
      description = subreddit[:data][:description]
      url = subreddit[:data][:url]
      subscribers = subreddit[:data][:subscribers]
      title = subreddit[:data][:title]
      icon_img = subreddit[:data][:icon_img]



      user.subreddits << Subreddit.find_or_create_by(display_name: display_name, description: description, url: url, subscribers: subscribers, title: title, icon_img: icon_img)

    end
  end



    #Make a model?




  # ["Authorization"] = "bearer #{user.token}"

  # Do we create subreddit model? I think so. Then we can make user.subreddits has_many

end
#response[:data][:children].first[:data].  /:description :display_name
