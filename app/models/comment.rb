class Comment < ApplicationRecord

  def self.all_comments(response)
    comments = []
    response[1][:data][:children].each do |comment|
      comments << self.extract_comment(comment)
    end
    comments
  end

  #make a comment
  def self.extract_comment(comment)
    comments = []
    c = comment[:data]
    comments << Comment.create(score: c[:score], replies: c[:replies], author: c[:author], parent_id: c[:parent_id], body: c[:body], body_html: c[:body_html], name: c[:name], depth: c[:depth])
    # c[:replies].each { |reply| extract_comment(reply) }
  end



  #if depth == 0, << to post
  #else << to parent  (comment.last?)
  #check for comments
end




#post
# author = response[:data][:children][:author]
# title = response[:data][:children][:title]
# url = response[:data][:children][:url]
# score = response[:data][:children][:score]
#comment
# response[1][:data][:children].each do |comment|
