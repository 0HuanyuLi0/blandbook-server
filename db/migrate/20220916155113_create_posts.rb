class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :title
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
