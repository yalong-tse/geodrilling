class CreateDrilltowers < ActiveRecord::Migration
  def change
    create_table :drilltowers do |t|
      t.string :model
      t.decimal :height
      t.decimal :deep
      t.decimal :effectiveload
      t.string :topsize
      t.string :pipequantityAndLenght
      t.string :sheaveQuantity
      t.decimal :weight
      t.decimal :workbenchHeight
      t.string :basePlatformsize
      t.string :manufacture
      t.string :manufactureContact
      t.string :picture
      t.string :remark

      t.timestamps
    end
  end
end
