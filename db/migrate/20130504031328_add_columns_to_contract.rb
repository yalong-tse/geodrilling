class AddColumnsToContract < ActiveRecord::Migration
  def change
    add_column :contracts,:projectname, :string
    add_column :contracts,:buyerparty, :string
    add_column :contracts,:projectaddr, :string
    add_column :contracts,:remark, :string
    add_column :contracts,:contractno, :string
    add_column :contracts,:owner, :string
    add_column :contracts,:fundsource,:string
    add_column :contracts,:contractamount,:string
  end
end
