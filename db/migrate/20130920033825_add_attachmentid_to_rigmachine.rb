class AddAttachmentidToRigmachine < ActiveRecord::Migration
  def change
    add_column :rigmachines, :attachment_id, :integer
  end
end
