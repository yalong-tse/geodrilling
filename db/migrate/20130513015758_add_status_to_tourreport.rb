class AddStatusToTourreport < ActiveRecord::Migration
  def change
    add_column :tourreports, :status, :string
  end
end
