class AddPropertyToWorkcontent < ActiveRecord::Migration
  def change
    add_column :workcontents,:upmore, :string
    add_column :workcontents,:corename, :string
    add_column :workcontents,:coregrade, :string
    add_column :workcontents,:corenumber, :string
    add_column :workcontents,:drillbittype, :string
    add_column :workcontents,:drillbitnumber, :string
    add_column :workcontents,:enlargertype, :string
    add_column :workcontents,:enlargernumber , :string
  end
end
