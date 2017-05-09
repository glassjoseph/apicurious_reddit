class User < ApplicationRecord

  # def self.from_omniauth(auth_info)
  #   where(uid: auth_info[:uid]).first_or_create do |new_user|
  #     new_user.uid                = auth_info.uid
  #     new_user.name               = auth_info.extra.raw_info.name
  #     new_user.screen_name        = auth_info.extra.raw_info.screen_name
  #     new_user.oauth_token        = auth_info.credentials.token
  #     new_user.oauth_token_secret = auth_info.credentials.secret
  #   end
  # end

  #Time_at(token_expiration)

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.token              = auth_info.credentials.token
      new_user.token_expiration   = auth_info.credentials.expires_at

    end
  end

  def expired?
    Time_at(token_expiration) > Time.now
  end

end
