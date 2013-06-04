class ChangeDictionaryColumn < ActiveRecord::Migration
  def up 
    #rename_column :dictionaries, :type, :dictype
    add_column :dictionaries, :dictype , :string
  end

  def down
    remove_column  :dictionaries, :dictype, :string
  end
end
