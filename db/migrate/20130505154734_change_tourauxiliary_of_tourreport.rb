class ChangeTourauxiliaryOfTourreport < ActiveRecord::Migration
  def up
    rename_column :tourreports, :tourauiliarytime,:tourauxiliarytime
  end

  def down
    rename_column :tourreports, :tourauxiliarytime,:tourauiliarytime
  end
end
