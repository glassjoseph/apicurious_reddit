class PostsController < ApplicationController

  def show
    response = RedditService.comments(params[:subreddit_id], params[:id])
    # @post = 
    @comments = Comment.all_comments(response)
  end
end
