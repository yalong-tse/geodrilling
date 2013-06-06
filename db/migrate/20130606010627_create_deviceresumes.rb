class CreateDeviceresumes < ActiveRecord::Migration
  def change
    create_table :deviceresumes do |t|
      t.string :devicenumber
      t.string :devicetype
      t.date :operatedate
      t.string :operatetype
      t.string :operator
      t.string :holenumber
      t.string :remark

      t.timestamps
    end
  end
end
