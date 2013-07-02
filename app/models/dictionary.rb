#encoding: utf-8
class Dictionary < ActiveRecord::Base
  # 字典的model
  # item 字典项
  # priority 顺序号
  # type 字典类型
  attr_accessible :delflag, :item, :priority, :remark, :dictype

  scope :fundsource, :conditions=>{:dictype=>"资金来源"}

  DICTYPE=[["工作内容"],["材料类型"],["资金来源"]];
  
end
