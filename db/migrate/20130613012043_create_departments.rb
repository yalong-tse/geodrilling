class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :depcode
      t.string :head
      t.string :phone
      t.string :address
      t.string :remark
      t.string :ancestry

      t.timestamps
    end
  end
end
