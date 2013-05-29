#encoding: utf-8
class Drilltower < ActiveRecord::Base
  # 钻塔的model类
  # basePlatformsize  底盘尺寸
  # deep  深度
  # effectiveload  有效载荷
  # height  高度
  # manufacture  厂商
  # manufactureContact  厂商联系人
  # model 型号 
  # picture 图片
  # pipequantityAndLength  提升钻杆根数与长度
  # remark 备注
  # sheaveQuantity 滑车组数与减轻负荷倍数
  # topsize 顶宽尺寸
  # weight 重量
  # workbenchHeight 工作台高度
  # name 名称
  # devicenumber 设备编号
  # status 占用状态
  # groupstatus  设备配组状态
  # rigmachine 配组的钻机ID
  attr_accessible :basePlatformsize, :deep, :effectiveload, :height, :manufacture, :manufactureContact, :model, :picture, :pipequantityAndLenght, :remark, :sheaveQuantity, :topsize, :weight, :workbenchHeight, :name, :devicenumber , :status, :groupstatus, :rigmachineid

  belongs_to :rigmachine ,:class_name=>"Rigmachine", :foreign_key=>"rigmachineid"

  scope :used , :conditions=>{ :status=>1}
  scope :unused , :conditions=>{:status=>0 || :status }
  scope :grouped , :conditions=>{:groupstatus=>1}
  scope :ungrouped , :conditions=>{:groupstatus=>0}

end
