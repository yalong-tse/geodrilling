class ChangeColumnMaterial < ActiveRecord::Migration
  def up
    add_column :materials , :materialtype, :string unless :materialtype
  end

  def down
    remove_column :materials , :materialtype, :string
  end
end
