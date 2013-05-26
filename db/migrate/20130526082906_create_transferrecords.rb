class CreateTransferrecords < ActiveRecord::Migration
  def change
    create_table :transferrecords do |t|
      t.string :devicenumber
      t.string :devicetype
      t.date :borrowdate
      t.string :borrower
      t.string :holenumber
      t.string :return
      t.date :returndate

      t.timestamps
    end
  end
end
