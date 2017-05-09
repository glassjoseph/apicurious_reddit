class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :token
      t.integer :token_expiration
      t.integer :link_karma
      t.integer :comment_karma

      t.timestamps
    end
  end
end
