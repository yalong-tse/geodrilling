class ChangeDesigndiameterOfHoles < ActiveRecord::Migration
  def up
    change_column :holes, :designdiameter, :string
    change_column :holes, :actualdiameter, :string
  end

  def down
    change_column :holes, :designdiameter, :integer
    change_column :holes, :actualdiameter, :integer
  end
end
