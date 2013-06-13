class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :sex
      t.date :birthday
      t.string :duty
      t.string :education
      t.string :mobile
      t.string :officephone
      t.string :email
      t.boolean :isappuser
      t.references :department
      t.string :account
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :department_id
  end
end
