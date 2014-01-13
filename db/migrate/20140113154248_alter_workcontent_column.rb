class AlterWorkcontentColumn < ActiveRecord::Migration
  def up
    change_column :workcontents, :drilllength, :float
    change_column :workcontents, :corelength, :float
    change_column :workcontents, :coreleftlength, :float
    change_column :workcontents, :holedeep, :float
    change_column :tourreports, :lastdeep, :float
    change_column :tourreports, :currentdeep, :float
    change_column :holes, :actualdeep, :float
  end

  def down
    change_column :workcontents, :drilllength, :string
    change_column :workcontents, :corelength, :string
    change_column :workcontents, :coreleftlength, :string
    change_column :workcontents, :holedeep, :string
    change_column :tourreports, :lastdeep, :string
    change_column :tourreports, :currentdeep, :string
    change_column :holes, :actualdeep, :string
  end
end
