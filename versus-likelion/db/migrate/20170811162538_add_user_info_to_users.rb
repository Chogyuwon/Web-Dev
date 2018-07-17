class AddUserInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :nickname, :string
    add_column :users, :email, :string
    add_column :users, :area, :string
  end
end
