class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :name
      t.string :content
      t.date :signdate
      t.date :startdate
      t.date :finishdate
      t.integer :status

      t.timestamps
    end
  end
end
