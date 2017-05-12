class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :score
      t.json    :replies
      t.string  :author
      t.string  :parent_id
      t.string  :body
      t.string  :body_html
      t.string  :name
      t.integer :depth
    end
  end
end
