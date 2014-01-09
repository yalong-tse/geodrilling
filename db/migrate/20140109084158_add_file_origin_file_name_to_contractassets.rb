class AddFileOriginFileNameToContractassets < ActiveRecord::Migration
  def change
    add_column :contractassets, :data_origin_file_name ,:string
  end
end
