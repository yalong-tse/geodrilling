class AddClosepropertyToHole < ActiveRecord::Migration
  def change
    add_column :holes, :opennoticeatt_id,:integer
    add_column :holes, :closenoticeatt_id , :integer
    add_column :holes, :curvetableatt_id, :integer
    add_column :holes, :measuretableatt_id ,:integer
    add_column :holes, :coretransferdoc_id, :integer
    add_column :holes, :tourreporttransferdoc_id,:integer
    add_column :holes, :qualitychecktable_id, :integer
    add_column :holes, :tourreporttabledoc_id , :integer
  end
end
