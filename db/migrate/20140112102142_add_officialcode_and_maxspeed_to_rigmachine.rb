class AddOfficialcodeAndMaxspeedToRigmachine < ActiveRecord::Migration
  def change
    add_column :rigmachines, :officialcode , :string
    add_column :rigmachines, :maxrotatespeed, :string
  end
end
