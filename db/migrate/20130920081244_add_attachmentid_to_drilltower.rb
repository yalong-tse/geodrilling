class AddAttachmentidToDrilltower < ActiveRecord::Migration
  def change
    add_column :drilltowers, :attachment_id ,:integer
  end
end
