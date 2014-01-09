class CreateContractassets < ActiveRecord::Migration
  def change
    create_table :contractassets do |t|
      t.string :data_file_name
      t.string :data_content_type
      t.decimal :data_file_size
      t.datetime :data_updated_at
      t.decimal :contract_id

      t.timestamps
    end
  end
end
