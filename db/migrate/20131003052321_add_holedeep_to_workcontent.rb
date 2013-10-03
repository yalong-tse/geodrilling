class AddHoledeepToWorkcontent < ActiveRecord::Migration
  def change
    add_column :workcontents,:holedeep, :decimal
  end
end
