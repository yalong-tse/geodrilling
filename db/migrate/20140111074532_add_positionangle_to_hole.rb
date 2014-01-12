class AddPositionangleToHole < ActiveRecord::Migration
  def change
    add_column :holes, :designpositionangle, :string
    add_column :holes, :actualpositionangle, :string
  end
end
