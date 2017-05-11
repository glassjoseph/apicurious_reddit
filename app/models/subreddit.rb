class Subreddit < ApplicationRecord
  belongs_to :user
  validates :display_name, uniqueness: true
  #
  # def self.from_omniauth(auth_info)
  #   subreddit = where(uid: auth_info[:uid]).first_or_create do |new_subreddit|
  #     new_subreddit.name                = auth_info.display_name
  #     new_subreddit.name               = auth_info.info.name
  #     new_subreddit.token              = auth_info.credentials.token
  #     new_subreddit.token_expiration   = auth_info.credentials.expires_at
  #   end
  #   subreddit
  # end
  def description_rendered
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(description)
  end


end
