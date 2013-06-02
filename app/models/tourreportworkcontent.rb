#encoding: utf-8
class Tourreportworkcontent < ActiveRecord::Base
  # 班报的工作内容实体
  #coresamplelength : 岩心长度
  #drillbit : 钻头
  #drillfootage :  进尺
  #finishtime ： 结束时间
  #starttime: 开始时间
  #pumppressure: 泵压
  #pumpquantity: 泵量
  #rotatespeed: 转速
  #tourreport : 班报
  #workcontent : 工作内容
  attr_accessible :coresamplelength, :drillbit, :drillfootage, :finishtime, :pumppressure, :pumpquantity, :rotatespeed, :starttime, :tourreport, :workcontent
  belongs_to :tourreport, :foreign_key=>"tourreport_id"
end
