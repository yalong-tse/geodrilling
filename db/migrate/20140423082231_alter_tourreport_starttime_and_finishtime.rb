class AlterTourreportStarttimeAndFinishtime < ActiveRecord::Migration
  def up
    change_column :tourreports, :starttime, :time
    change_column :tourreports, :finishtime, :time

  end

  def down
    change_column :tourreports, :starttime, :datetime
    change_column :tourreports, :finishtime, :datetime
  end
end
