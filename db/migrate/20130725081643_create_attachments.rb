class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :filename
      t.string :filetype
      t.string :savefilename
      t.string :savepath

      t.timestamps
    end
  end
end
