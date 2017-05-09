class User < ApplicationRecord


  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      # binding.pry
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.token              = auth_info.credentials.token
      new_user.token_expiration   = auth_info.credentials.expires_at
      new_user.link_karma         = auth_info.extra.raw_info.comment_karma
      new_user.comment_karma      = auth_info.extra.raw_info.link_karma
    end
  end

  def expired?
    # Time.now.to_i
    Time.at(token_expiration) < Time.now
  end

end
