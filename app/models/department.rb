#encoding: utf-8
class Department < ActiveRecord::Base
  
  ##
  # name, 部门名称
  # depcode, 部门编码
  # head, 负责人
  # phone, 电话
  # address, 地址
  # remark, 备注
  has_ancestry
  attr_accessible :name, :depcode, :head, :phone, :address, :remark, :parent, :parent_id
  has_many :users, :dependent => :destroy
  
  def to_node
    { "id" => self.id,
      "text" => self.name,
      "item" => self.children.map { |c| c.to_node }
    }
  end

  def self.to_dhtmlxtree_node
    { :id => 0, :item => dhtmlxtree(Department.arrange :order=> :depcode) }
  end

  def self.dhtmlxtree(nodes)
    nodes.map do |node, sub_nodes|
      if sub_nodes.empty?
        { :id => node.id, :text => node.name }
      else
        # open the root child
        if node.depth == 0 
          { :id => node.id, :text => node.name, :open => 1, :item => dhtmlxtree(sub_nodes).compact }
        else
          { :id => node.id, :text => node.name, :item => dhtmlxtree(sub_nodes).compact }
        end
      end
    end
  end

end
