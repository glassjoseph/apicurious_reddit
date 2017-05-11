class Subreddit < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :display_name, uniqueness: true

  def description_rendered
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(description)
  end


end
