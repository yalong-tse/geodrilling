class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :type
      t.string :model
      t.decimal :count
      t.decimal :price
      t.date :stockdate
      t.string :recorder
      t.string :remark

      t.timestamps
    end
  end
end
