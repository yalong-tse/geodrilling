class AddLastdeepToTourreport < ActiveRecord::Migration
  def change
    add_column :tourreports, :lastdeep, :integer
    add_column :tourreports, :currentdeep , :integer
    add_column :tourreports, :intrumenttakeover, :string
    add_column :tourreports, :takeoverremark , :string

  end
end
