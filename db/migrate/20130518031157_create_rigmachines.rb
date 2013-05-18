class CreateRigmachines < ActiveRecord::Migration
  def change
    create_table :rigmachines do |t|
      t.string :rigmodel
      t.decimal :righoleDeep
      t.decimal :pipeDiameter
      t.decimal :rigPower
      t.decimal :rotatingSpeed
      t.decimal :rigweight
      t.string :manufacture
      t.string :manufactureContact
      t.string :overallsize
      t.string :picture
      t.string :remark

      t.timestamps
    end
  end
end
