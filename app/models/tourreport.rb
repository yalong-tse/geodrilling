#encoding: utf-8
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
  # status : 班报状态
  # intrumenttakeover : 钻具交接
  # takeoverremark 交接说明
  # lastdeep 接班孔深
  # currentdeep 交班孔深
  attr_accessible :administrator, :finishtime, :holeid, :recorder, :remark, :starttime, :tourauxiliarytime, :tourcore, :tourdate, :tourdrillingtime, :tourleader, :tourshift, :status, :lastdeep, :currentdeep, :intrumenttakeover, :takeoverremark
  # 属于哪个钻孔
  belongs_to :hole, :class_name=>"Hole", :foreign_key=>"holeid"
  has_many :tourreportworkcontent
  TOURTIME=[['00:00'],['08:00'],['16:00']]
  TOURTIME2=[['00:00'],['12:00']]
  WORKITEM=[['钻进'],['起下钻、取心'],['起钻、取心'],['起钻'],['下钻'],['取心'],['孔内事故'],['设备事故'],['停待'],['简易水文观测'],['封孔'],['其他']]

  scope :archive, :conditions => {:status=>2}

  # 根据钻孔id 查询班报
  def self.gettourreports(holenumber)
    if holenumber
      where("holeid =?", holenumber).order("holeid desc")
    else
      order("holeid desc")
    end
  end

end
