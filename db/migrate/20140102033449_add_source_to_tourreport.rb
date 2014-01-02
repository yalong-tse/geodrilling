class AddSourceToTourreport < ActiveRecord::Migration
  def change
    add_column :tourreports, :source, :decimal
  end
end
