class CreateWorkcontents < ActiveRecord::Migration
  def change
    create_table :workcontents do |t|
      t.time :starttime
      t.time :finishtime
      t.string :content
      t.integer :drilllength
      t.string :drillbit
      t.string :rotatespeed
      t.string :pumpquantity
      t.string :pumppressure
      t.integer :corelength
      t.integer :coreleftlength
      t.integer :tourreportid
      t.integer :holeid

      t.timestamps
    end
  end
end
