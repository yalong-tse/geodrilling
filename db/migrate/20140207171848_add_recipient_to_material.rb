class AddRecipientToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :recipient, :string
  end
end
