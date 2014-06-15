class CreateLastyearlefts < ActiveRecord::Migration
  def change
    create_table :lastyearlefts do |t|
      t.string :year
      t.float :lastyeartotallength

      t.timestamps
    end
  end
end
