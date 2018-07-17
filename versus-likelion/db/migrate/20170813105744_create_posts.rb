class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :post_type
      t.string :first_choice_label
      t.string :second_choice_label
      t.string :use_speaker
      t.string :image_1
      t.string :image_2
      t.string :image_3
      
      
      t.text :content

      t.timestamps
    end
  end
end
