class CreatePumps < ActiveRecord::Migration
  def change
    create_table :pumps do |t|
      t.string :pumpmodel
      t.string :pumpDiameter
      t.decimal :pumplineNumber
      t.decimal :stroke
      t.decimal :strokeTimes
      t.decimal :traffic
      t.decimal :pressure
      t.decimal :power
      t.string :overallsize
      t.decimal :weight
      t.string :manufacture
      t.string :manufactureContact
      t.string :picture
      t.string :remark

      t.timestamps
    end
  end
end
