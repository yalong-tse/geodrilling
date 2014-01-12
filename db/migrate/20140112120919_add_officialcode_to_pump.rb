class AddOfficialcodeToPump < ActiveRecord::Migration
  def change
    add_column :pumps, :officialcode ,:string
  end
end
