class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :type
      t.string :item
      t.boolean :delflag
      t.decimal :priority
      t.string :remark

      t.timestamps
    end
  end
end
