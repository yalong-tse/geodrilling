class AddMinecoreToHole < ActiveRecord::Migration
  def change
    add_column :holes, :designminecoreratio, :string
    add_column :holes, :actualminecoreratio, :string
  end
end
