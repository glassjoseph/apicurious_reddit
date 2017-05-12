class Post < ApplicationRecord
  belongs_to :subreddit
    validates :id, uniqueness: true

    def self.newest(subreddit_url)
      posts = []
      response = RedditService.subreddit_posts(subreddit_url)
      response[:data][:children].each do |post|
        pd = post[:data]
        posts << Post.new(data: post[:data], pid: pd[:pid], url: pd[:url], score: pd[:score], preview: pd[:preview], title: pd[:title], downs: pd[:downs], ups: pd[:ups], permalink: pd[:permalink], thumbnail: pd[:thumbnail])
      end
      posts.take(15)
    end
end
