class AddLastyearpriceToLastyearleft < ActiveRecord::Migration
  def change
  	add_column :lastyearlefts , :lastyearprice, :string
  end
end
