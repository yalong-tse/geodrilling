class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :category
      t.integer :quantity
      t.string :keeper
      t.string :borrower
      t.integer :usage

      t.timestamps
    end
  end
end
