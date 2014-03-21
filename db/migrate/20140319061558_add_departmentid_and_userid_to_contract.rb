class AddDepartmentidAndUseridToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :department_id, :decimal
    add_column :contracts, :administrator_id, :decimal
  end
end
