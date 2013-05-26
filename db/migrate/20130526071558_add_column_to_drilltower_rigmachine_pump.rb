class AddColumnToDrilltowerRigmachinePump < ActiveRecord::Migration
  def change
    add_column :drilltowers , :name , :string
    add_column :drilltowers , :devicenumber , :string
    add_column :drilltowers, :status , :boolean
    add_column :drilltowers, :groupstatus , :boolean
    add_column :drilltowers, :rigmachineid , :decimal
    add_column :pumps , :name , :string
    add_column :pumps , :devicenumber , :string
    add_column :pumps , :status , :boolean
    add_column :pumps , :groupstatus , :boolean
    add_column :pumps , :rigmachineid , :decimal
    add_column :rigmachines  , :name , :string
    add_column :rigmachines , :devicenumber , :string
    add_column :rigmachines , :status , :boolean
  end
end
