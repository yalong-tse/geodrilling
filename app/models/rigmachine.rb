#encoding: utf-8
class Rigmachine < ActiveRecord::Base
  # 钻机的Model
  # manufacture 厂商
  # manufactureContact  厂商联系方式
  # overallsize 外观尺寸
  # picture  图片
  # pipeDiameter 钻孔直径
  # remark 备注
  # rigpower 钻机功率
  # righoleDeep 钻孔深度
  # rigmodel 钻机型号
  # rigweight 钻机重量
  # rotatingSpeed 转速 
  attr_accessible :manufacture, :manufactureContact, :overallsize, :picture, :pipeDiameter, :remark, :rigPower, :righoleDeep, :rigmodel, :rigweight, :rotatingSpeed
end
