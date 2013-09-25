#encoding:utf-8
class Material < ActiveRecord::Base
  # name 名称
  # model 型号
  # type 类型
  # count 数量
  # price 采购价格
  # stockdate 入库日期
  # recorder 记录人
  attr_accessible :count, :model, :name, :price, :recorder, :remark, :stockdate, :materialtype, :manufacture , :holeid

  belongs_to :hole, :class_name=>"Hole", :foreign_key=>"holeid"

  #设备处理的类型
  DISCARD_TYPE = [['设备报废'],['设备出租'],['设备转让']];

end
