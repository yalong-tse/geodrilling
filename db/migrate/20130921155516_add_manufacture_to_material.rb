class AddManufactureToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :manufacture, :string
  end
end
