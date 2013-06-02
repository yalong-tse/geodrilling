class CreateTourreportworkcontents < ActiveRecord::Migration
  def change
    create_table :tourreportworkcontents do |t|
      t.integer :tourreport_id
      t.time :starttime
      t.time :finishtime
      t.string :workcontent
      t.string :drillfootage
      t.string :drillbit
      t.string :rotatespeed
      t.string :pumppressure
      t.string :pumpquantity
      t.string :coresamplelength

      t.timestamps
    end
  end
end
