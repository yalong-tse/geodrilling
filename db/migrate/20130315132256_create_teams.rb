class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :leader
      t.string :contact
      t.integer :memberquantity

      t.timestamps
    end
  end
end
