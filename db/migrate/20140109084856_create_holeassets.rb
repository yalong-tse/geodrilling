class CreateHoleassets < ActiveRecord::Migration
  def change
    create_table :holeassets do |t|
      t.string :data_content_type
      t.string :data_file_name
      t.decimal :data_file_size
      t.datetime :data_updated_at
      t.decimal :hole_id
      t.string :data_origin_file_name

      t.timestamps
    end
  end
end
