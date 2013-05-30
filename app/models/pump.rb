#encoding: utf-8
class Pump < ActiveRecord::Base
  # 泥浆泵的model
  #manufacture 厂商
  #manufactureContact 厂商联系方式
  #orervallsize 外观尺寸
  #picture 图片
  #power  功率
  #pressure 压力
  #pumpDiameter 缸径
  #pumplineNumber 缸数
  #pumpmodel 型号
  #stroke 冲程
  #strokeTimes 冲次
  #traffic 流量
  #weight 重量
  #remark 备注
  #status 设备占用状态
  #groupstatus  配组状态
  #rigmachine 配组的钻机的ID
  #name 设备名称
  #devicenumber 设备编号
  attr_accessible :manufacture, :manufactureContact, :overallsize, :picture, :power, :pressure, :pumpDiameter, :pumplineNumber, :pumpmodel, :remark, :stroke, :strokeTimes, :traffic, :weight, :name , :devicenumber, :status, :groupstatus ,:rigmachineid

  belongs_to :rigmachine , :class_name=>"Rigmachine" , :foreign_key=>"rigmachineid"

  scope :used ,:conditions=>{:status=>1}
  scope :unused , where("status=0 or status is null")
  scope :grouped , :conditions=>{:groupstatus=>1}
  scope :ungrouped ,:conditions=>{:groupstatus=>0}
end
