class AddAnomyToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :anomy, :boolean
  end
end
