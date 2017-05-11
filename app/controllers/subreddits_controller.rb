class SubredditsController < ApplicationController

  def index
    @subreddits = Subreddit.all
  end

  def show
    @subreddit = Subreddit.find_by(display_name: params[:id])

    @posts = Post.newest(@subreddit.url)
  end

end
