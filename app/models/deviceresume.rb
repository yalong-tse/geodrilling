#encoding: utf-8
class Deviceresume < ActiveRecord::Base
  # devicenumber 设备编号
  # devicetype 设备类型
  # holenumber 孔号
  # operatedate 操作日期
  # operatetype 操作类型, 主要分为借入和借出
  # operator 操作人
  # remark 备注
  attr_accessible :devicenumber, :devicetype, :holenumber, :operatedate, :operatetype, :operator, :remark
  # 操作类型的字典
  OPERATETYPE =[[1,"借出"],[2,"归还"]]

  scope :borrowed , :conditions=>{:operatetype=>"1"}
  scope :returned , :conditions=>{:operatetype=>"2"}
  scope :rigmachine , :conditions=>{:devicetype=>"rigmachine"}


end
