class AddStockinToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :stockin,:decimal
  end
end
