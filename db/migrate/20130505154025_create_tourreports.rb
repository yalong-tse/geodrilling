class CreateTourreports < ActiveRecord::Migration
  def change
    create_table :tourreports do |t|
      t.integer :holeid
      t.date :tourdate
      t.datetime :starttime
      t.datetime :finishtime
      t.string :administrator
      t.string :tourleader
      t.string :recorder
      t.string :tourshift
      t.string :tourcore
      t.string :tourdrillingtime
      t.string :tourauiliarytime
      t.string :remark

      t.timestamps
    end
  end
end
