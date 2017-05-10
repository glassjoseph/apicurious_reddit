class User < ApplicationRecord
  has_many :subreddits

  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.token              = auth_info.credentials.token
      new_user.token_expiration   = auth_info.credentials.expires_at
      new_user.link_karma         = auth_info.extra.raw_info.comment_karma
      new_user.comment_karma      = auth_info.extra.raw_info.link_karma
    end
    user.update_token(auth_info)
    user
  end


  def update_token(auth_info)
    # binding.pry
    update_attribute(:token, auth_info[:credentials][:token]) unless self.new_record?
    self.save
  end

  def expired?
    Time.at(token_expiration) < Time.now
  end

end
