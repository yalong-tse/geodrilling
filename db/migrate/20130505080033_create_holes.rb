class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :designdeep
      t.integer :actualdeep
      t.integer :designdiameter
      t.integer :actualdiameter
      t.date :finishdate
      t.date :startdate
      t.integer :contract_id
      t.string :minearea
      t.string :holenumber
      t.string :geologysituation
      t.string :designapexangle
      t.string :actualapexangle
      t.string :designcoreratio
      t.string :actualcoreratio
      t.string :designbook
      t.string :drillingpurpose
      t.integer :status
      t.string :remark
    end
  end

end
