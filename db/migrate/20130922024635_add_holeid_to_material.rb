class AddHoleidToMaterial < ActiveRecord::Migration
  def change
    add_column :materials,:holeid ,:integer
  end
end
