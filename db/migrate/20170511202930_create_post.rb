class CreatePost < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string  :pid
      t.json  :data
      t.string  :url
      t.integer :score
      t.json  :preview
      t.string  :title
      t.integer :downs
      t.integer :ups
      t.string  :permalink
      t.string  :thumbnail
      t.references :subreddit, foreign_key: true
    end
  end
end
