#encoding: utf-8
class Equipment < ActiveRecord::Base
  attr_accessible :borrower, :category, :keeper, :name, :quantity, :usage

  #设备处理的类型
  DISCARD_TYPE = [['设备报废'],['设备出租'],['设备转让']];
end
