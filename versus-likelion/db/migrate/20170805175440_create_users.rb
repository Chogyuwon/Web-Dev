class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.boolean :admin
      t.string :name
      t.string :image
      t.string :token
			t.string :refresh_token
	 		t.string :expires_at 
	 		t.string :expires
      t.timestamps
    end
  end
end
