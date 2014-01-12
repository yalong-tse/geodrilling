class AddWorkshiftToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :workshift, :string
  end
end
