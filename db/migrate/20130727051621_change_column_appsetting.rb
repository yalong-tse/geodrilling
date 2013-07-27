class ChangeColumnAppsetting < ActiveRecord::Migration
  def up
    rename_column :appsettings, :type, :settingtype
  end

  def down
    rename_column :appsettings, :settingtype, :type
  end
end
