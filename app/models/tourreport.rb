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
  # 如果为外协孔，只需要填写0-24小时，然后填写班报日期，班报时间和进尺即可和项目经理
  attr_accessible :administrator, :finishtime, :holeid, :recorder, :remark, :starttime, :tourauxiliarytime, :tourcore, :tourdate, :tourdrillingtime, :tourleader, :tourshift, :status, :lastdeep, :currentdeep, :intrumenttakeover, :takeoverremark, :holeaccidenttime,:deviceaccidenttime,:othertime,:totaltime,:projectmanager,:lastleader,:nextleader,:centralizer,:antideviation
  # 属于哪个钻孔
  belongs_to :hole, :class_name=>"Hole", :foreign_key=>"holeid"
  has_many :tourreportworkcontent
  TOURTIME=[['00:00'],['01:00'],['02:00'],['03:00'],['04:00'],['05:00'],['06:00'],['07:00'],['08:00'],['09:00'],['10:00'],['11:00'],['12:00'],['13:00'],['14:00'],['15:00'],['16:00'],['17:00'],['18:00'],['19:00'],['20:00'],['21:00'],['22:00'],['23:00'],['24:00']]
  #TOURTIME2=[['00:00'],['12:00']]
  WORKITEM=[['接班'],['交班'],['辅助'],['钻进'],['起下钻、取心'],['起钻、取心'],['起钻'],['下钻'],['取心'],['孔内事故'],['设备故障'],['停待'],['简易水文观测'],['封孔'],['其他']]

  scope :archive, :conditions => {:status=>2}

  # 根据钻孔id 查询班报
  def self.gettourreports(holeid)
    if holeid
      where("holeid =?", holeid).order("holeid desc")
    else
      order("holeid desc")
    end
  end

  # 获取上一个班报的钻具交接的内容,方便用户填写
  def self.getLastTakeovertools(holeid)
    if holeid
      tourreport = self.where("holeid=?",holeid).order("tourdate desc,starttime desc").first
      if tourreport
        tourreport.intrumenttakeover
      end
    end
  end

  #获取该钻孔的上一班的孔深,上一个班报的当前孔深才对
  def self.getLastHoleDeep(holeid)
    if holeid
      tourreport = self.where("holeid=?",holeid).order("tourdate desc,starttime desc,id desc").first
      if tourreport
        tourreport.currentdeep
      end
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
        if (thetime)
          h,m = thetime.split(/:/);
          hours = hours+h.to_i;
          minutes = minutes + m.to_i;
        end
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
    summary = 0.0;
    if (holeid && !holeid.nil?)
      where("holeid=?",holeid).pluck(:tourshift).each do |tourshift|
        summary = summary + tourshift.to_i
      end
      #logger.info("the summary is " + summary.to_s)
      hours = sum_totaltime(holeid)
      #logger.info("the hours is :" + hours.to_s)
      if hours==0 
        return 0
      end
      return format("%.2f",(summary/hours)*30.0*24.0)
    end
  end

end
