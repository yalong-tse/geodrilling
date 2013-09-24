class AddLeaderidToUser < ActiveRecord::Migration
  def change
    add_column :users, :leaderid, :integer
  end
end
