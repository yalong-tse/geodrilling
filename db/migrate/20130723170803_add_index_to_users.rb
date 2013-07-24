class AddIndexToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.index :account, :unique => true
    end
  end

  def self.down
    change_table :users do |t|
      t.remove_index :account
    end
  end
end
