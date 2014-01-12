#encoding: utf-8
class Dictionary < ActiveRecord::Base
  # 字典的model
  # item 字典项
  # priority 顺序号
  # type 字典类型
  attr_accessible :delflag, :item, :priority, :remark, :dictype

  scope :fundsource, :conditions=>{:dictype=>"资金来源"}
  scope :material, :conditions=>{:dictype=>"材料名称"}
  scope :diameters , :conditions=>{:dictype=>"钻孔直径"}
  scope :purpose , :conditions=>{:dictype=>"钻探目的"}

  DICTYPE=[["工作内容"],["材料名称"],["资金来源"],["钻孔直径"],["钻探目的"]];
  
end
