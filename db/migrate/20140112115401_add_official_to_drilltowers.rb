class AddOfficialToDrilltowers < ActiveRecord::Migration
  def change
    add_column :drilltowers, :officialcode , :string
  end
end
