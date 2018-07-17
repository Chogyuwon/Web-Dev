class AddAnomyToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :anomy, :boolean
  end
end
