class SessionsController < ApplicationController

  def create
    auth_info = request.env["omniauth.auth"]
    if user = User.from_omniauth(auth_info)
      session[:user_id] = user.id
      RedditService.user_subreddits(user)
    end

    # token = auth_info['credentials']['token']
    redirect_to root_path
  end

end
