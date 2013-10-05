class AddDiscardPropertyToRigmachineDrilltowerPump < ActiveRecord::Migration
  def change
    add_column :rigmachines, :discarddate,:date
    add_column :rigmachines, :discardtype,:string
    add_column :rigmachines, :discardreason, :string
    add_column :drilltowers, :discarddate, :date
    add_column :drilltowers, :discardtype, :string
    add_column :drilltowers, :discardreason, :string
    add_column :pumps ,:discarddate, :date
    add_column :pumps ,:discardtype, :string
    add_column :pumps ,:discardreason ,:string
  end
end
