class SessionsController < ApplicationController

  def create

    auth_info = request.env["omniauth.auth"]

    binding.pry
    if user = User.from_omniauth(auth_info)
      session[:user_id] = user.id
      # user.token =
    end

    # token = auth_info['credentials']['token']
    redirect_to root_path
  end

end
