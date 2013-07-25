class AddAttachmentidToContract < ActiveRecord::Migration
  def change
    add_column :contracts , :attachment_id, :integer
  end
end
