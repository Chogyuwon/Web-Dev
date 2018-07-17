class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.string :vote_choice

      t.timestamps
    end
  end
end
