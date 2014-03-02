class AddUnitpriceOutputToHole < ActiveRecord::Migration
  def change
    add_column :holes, :unitprice, :decimal
    add_column :holes, :output, :decimal
    add_column :holes, :outerflag, :decimal
  end
end
