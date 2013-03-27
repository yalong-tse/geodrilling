class AddColumnsToHole < ActiveRecord::Migration
  def change
    add_column :holes, :minearea, :string
    add_column :holes, :minenumber, :string
    add_column :holes, :geology, :string
  end
end
