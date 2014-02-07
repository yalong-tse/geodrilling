#encoding:utf-8
class Material < ActiveRecord::Base
  # name 名称
  # model 型号
  # type 类型
  # count 数量
  # price 采购价格
  # stockdate 入库日期
  # recorder 记录人
  # recipient 领用人
  attr_accessible :count, :model, :name, :price, :recorder, :remark, :stockdate, :materialtype, :manufacture , :holeid,:stockin,:recipient
  belongs_to :hole, :class_name=>"Hole", :foreign_key=>"holeid"

end
