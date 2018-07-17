class CreateContries < ActiveRecord::Migration[5.1]
  def change
    create_table :contries do |t|
      t.string :continent
      t.string :cont_image
      t.string :cont_name
      t.string :center
      t.string :pop
      t.string :area
      t.string :money
      t.string :lang
      t.string :religion

      t.timestamps
    end
  end
end
