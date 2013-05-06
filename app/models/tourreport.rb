class Tourreport < ActiveRecord::Base
  # administrator: 机长
  # finishtime: 开始时间
  # holeid ： 关联的钻孔
  # recorder : 记录员
  # remark : 备注
  # starttime : 班报结束时间
  # tourcore : 本班取心
  # tourdate : 本班日期
  # tourdrillingtime: 本班纯钻时间
  # tourleader : 班长
  # tourshift : 本班进尺
  attr_accessible :administrator, :finishtime, :holeid, :recorder, :remark, :starttime, :tourauxiliarytime, :tourcore, :tourdate, :tourdrillingtime, :tourleader, :tourshift
end
