class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :deep
      t.integer :diameter
      t.date :startdate
      t.date :finishdate

      t.timestamps
    end
  end
end
