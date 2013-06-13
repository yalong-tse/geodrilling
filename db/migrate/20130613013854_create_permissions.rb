class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.text :description
      t.string :subject_class
      t.string :action

      t.timestamps
    end
  end
end
