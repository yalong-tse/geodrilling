class CreateAppsettings < ActiveRecord::Migration
  def change
    create_table :appsettings do |t|
      t.string :name
      t.string :type
      t.string :value

      t.timestamps
    end
  end
end
