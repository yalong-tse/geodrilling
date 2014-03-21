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
  attr_accessible :name, :depcode, :head, :phone, :address, :remark, :parent, :parent_id, :newitemnext, :selectitem
  has_many :users, :dependent => :destroy
  
  def to_node
    { "id" => self.id,
      "text" => self.name,
      "item" => self.children.map { |c| c.to_node }
    }
  end

  # for 合同中下拉框的选择
  def self.to_select
    arr = []
    order("id asc").each do |d|
      arr << [d.name,d.id]
    end
    return arr
  end

  # 
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

  def self.dynamic_dhtmlxtree(id)
    if id.to_i == 0 then
      a = {:id => 0,:item => []}
      Department.roots.each do |d|
        b = {}
        if d.has_children? then
          b[:id] = d.id
          b[:child] = 1
          b[:text] = d.name
          a[:item] << b
        else
          b[:id] = d.id
          b[:text] = d.name
          a[:item] << b
        end
      end
    else
      dept = Department.find(id)
      a = {:id => dept.id, :text => dept.name, :child => 1, :item => []}
      dept.children.each do |d|
        b = {}
        if d.has_children? then
          b[:id] = d.id
          b[:child] = 1
          b[:text] = d.name
          a[:item] << b
        else
          b[:id] = d.id
          b[:text] = d.name
          a[:item] << b
        end
      end
    end
    return a
  end


end
