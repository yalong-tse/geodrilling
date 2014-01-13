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
  # source : 来源类型，大平台还是mobile 平台， 1-大平台 2-Android移动平台
  # intrumenttakeover : 钻具交接
  # takeoverremark 交接说明
  # lastdeep 接班孔深
  # currentdeep 交班孔深
  # holeaccidenttime, 孔内事故时间
  # deviceaccidenttime, 设备事故时间
  # othertime, 其他时长
  # totaltime, 合计时长
  # projectmanager ,项目经理
  # lastleader 上一个班长，交班班长
  # nextleader 下一个班长，接班班长
  # centralizer 扶正器长
  # antideviation 防斜措施
  # mudamount 泥浆消耗量
  attr_accessible :administrator, :finishtime, :holeid, :recorder, :remark, :starttime, :tourauxiliarytime, :tourcore, :tourdate, :tourdrillingtime, :tourleader, :tourshift, :status, :lastdeep, :currentdeep, :intrumenttakeover, :takeoverremark, :holeaccidenttime,:deviceaccidenttime,:othertime,:totaltime,:projectmanager,:lastleader,:nextleader,:centralizer,:antideviation
  # 属于哪个钻孔
  belongs_to :hole, :class_name=>"Hole", :foreign_key=>"holeid"
  has_many :tourreportworkcontent
  TOURTIME=[['00:00'],['08:00'],['16:00'],['03:00'],['15:00']]
  TOURTIME2=[['00:00'],['12:00']]
  WORKITEM=[['钻进'],['起下钻、取心'],['起钻、取心'],['起钻'],['下钻'],['取心'],['孔内事故'],['设备故障'],['停待'],['简易水文观测'],['封孔'],['其他']]

  scope :archive, :conditions => {:status=>2}

  # 根据钻孔id 查询班报
  def self.gettourreports(holeid)
    if holeid
      where("holeid =?", holeid).order("holeid desc")
    else
      order("holeid desc")
    end
  end

  # 获取该孔的岩心采取长度
  def self.sumcore(holeid)
    if holeid
      sum(:tourcore,:conditions=>{:holeid=>holeid});
    else
      0
    end
  end


  # 获取某个孔的所有的纯钻时长
  def self.sum_drillingtime(holeid)
    hours = 0;
    minutes = 0;
    if(holeid)
      where("holeid=?",holeid).pluck(:tourdrillingtime).each do |thetime|
        h,m = thetime.split(/:/)
        hours=hours+h.to_i
        minutes = minutes+m.to_i
      end
      # 此处会有小数
      r = (minutes/60.0);
      hours = hours+r;
      return hours;
      #sum(:tourdrillingtime, :conditions=>{:holeid=>holeid})
    else
      0
    end
  end

  #获取该孔的所有辅助时长
  def self.sum_auxtime(holeid)
    hours = 0;
    minutes = 0;
    if(holeid)
      #sum(:tourauxiliarytime,:conditions=>{:holeid=>holeid})
      where("holeid=?",holeid).pluck(:tourauxiliarytime).each do |thetime|
        h,m = thetime.split(/:/);
        hours = hours+h.to_i;
        minutes = minutes + m.to_i;
      end
      r = minutes/60.0;
      hours = hours+r;
      return hours;
    else
      0
    end
  end

  #获取该孔的所有总计时长
  def self.sum_totaltime(holeid)
    hours = 0;
    minutes = 0;
    if(holeid)
      #sum(:tourauxiliarytime,:conditions=>{:holeid=>holeid})
      where("holeid=?",holeid).pluck(:totaltime).each do |thetime|
        h,m = thetime.split(/:/);
        hours = hours+h.to_i;
        minutes = minutes + m.to_i;
      end
      r = minutes/60.0;
      hours = hours+r;
      return hours;
    else
      0
    end
  end

  # 计算台月效率的方法,不知道是否正确
  def self.montheffiency(holeid)
    summary = 0;
    if (holeid && !holeid.nil?)
      where("holeid=?",holeid).pluck(:tourshift).each do |tourshift|
        summary = summary + tourshift.to_i
      end
      hours = sum_totaltime(holeid)
      return (summary/hours) *30*24
    end
  end

end
