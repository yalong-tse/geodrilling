class AddContractidToHoles < ActiveRecord::Migration
  def change
    add_column :holes,:contract_id,:integer
  end
end
