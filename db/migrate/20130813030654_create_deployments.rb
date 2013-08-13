class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.references :hole
      t.references :pump
      t.references :rigmachine
      t.references :drilltower
      t.references :user

      t.timestamps
    end
    add_index :deployments, :hole_id
    add_index :deployments, :pump_id
    add_index :deployments, :rigmachine_id
    add_index :deployments, :drilltower_id
    add_index :deployments, :user_id
  end
end
