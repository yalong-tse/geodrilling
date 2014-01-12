class CreateDevicephotos < ActiveRecord::Migration
  def change
    create_table :devicephotos do |t|
      t.string :data_content_type
      t.string :data_file_name
      t.datetime :data_update_at
      t.string :data_origin_file_name
      t.string :data_file_size

      t.timestamps
    end
  end
end
