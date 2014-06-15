class AddUnitPriceToHoles < ActiveRecord::Migration
  def change
  	add_column :holes, :unit_price, :string
  end
end
