class AddAttachmentidToHoles < ActiveRecord::Migration
  def change
    add_column :holes, :attachment_id, :integer
  end
end
