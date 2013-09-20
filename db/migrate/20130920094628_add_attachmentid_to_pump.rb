class AddAttachmentidToPump < ActiveRecord::Migration
  def change
    add_column :pumps, :attachment_id ,:integer
  end
end
