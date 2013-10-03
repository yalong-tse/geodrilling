class AddPropertyToTourreport < ActiveRecord::Migration
  def change
    add_column :tourreports, :holeaccidenttime,:string
    add_column :tourreports, :deviceaccidenttime, :string
    add_column :tourreports, :othertime, :string
    add_column :tourreports, :totaltime, :string
    add_column :tourreports, :projectmanager, :string
    add_column :tourreports, :lastleader,:string
    add_column :tourreports, :nextleader, :string
    add_column :tourreports, :centralizer, :string
    add_column :tourreports, :antideviation, :string 
  end
end
