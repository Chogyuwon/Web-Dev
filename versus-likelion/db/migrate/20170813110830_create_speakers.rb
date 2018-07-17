class CreateSpeakers < ActiveRecord::Migration[5.1]
  def change
    create_table :speakers do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
