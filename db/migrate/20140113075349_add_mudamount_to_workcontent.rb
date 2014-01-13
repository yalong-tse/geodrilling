class AddMudamountToWorkcontent < ActiveRecord::Migration
  def change
    add_column :workcontents, :mudamount, :string
  end
end
