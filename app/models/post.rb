class Post < ApplicationRecord
  belongs_to :subreddit
    validates :id, uniqueness: true

    def self.newest(subreddit_url)
      posts = []
      response = RedditService.subreddit_posts(subreddit_url)
      response[:data][:children].each do |post|
        data = post[:data]
        pid = post[:data][:id]
        url = post[:data][:url]
        score = post[:data][:score]
        preview = post[:data][:preview]
        title = post[:data][:title]
        downs = post[:data][:downs]
        ups = post[:data][:ups]
        permalink = post[:data][:permalink]
        thumbnail = post[:data][:thumbnail]
        # subreddit <<
        posts << Post.new(data: data, pid: pid, url: url, score: score, preview: preview, title: title, downs: downs, ups: ups, permalink: permalink, thumbnail: thumbnail)
      end
      posts.take(15)
    end



end
