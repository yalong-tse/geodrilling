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
  attr_accessible :manufacture, :manufactureContact, :overallsize, :picture, :power, :pressure, :pumpDiameter, :pumplineNumber, :pumpmodel, :remark, :stroke, :strokeTimes, :traffic, :weight
end
