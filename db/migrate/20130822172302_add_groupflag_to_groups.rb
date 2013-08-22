class AddGroupflagToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :groupflag, :integer
  end
end
