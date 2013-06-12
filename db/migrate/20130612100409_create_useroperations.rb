class CreateUseroperations < ActiveRecord::Migration
  def change
    create_table :useroperations do |t|
      t.string :username
      t.string :useraccount
      t.decimal :userid
      t.string :userip
      t.datetime :operatetime
      t.string :operatecontent
      t.string :remark

      t.timestamps
    end
  end
end
