class CreatePostLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :post_likes do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :like_type

      t.timestamps
    end
  end
end
