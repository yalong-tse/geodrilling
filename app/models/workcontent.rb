#encoding: utf-8
#content 工作内容
#starttime  开始时间
#finishtime 截止时间
#drilllength 钻进
#drillbit 钻头规格
#rotatespeed 转速
#pumpquantity 泵量
#pumppressure 泵压
#corelength 取心长度
#coreleftlength 残留岩心长度
#upmore 上余
#corename 岩心名称
#coregrade 岩心等级
#corenumber 岩心编号
#drillbittype 钻头类型
#drillbitnumber 钻头编号
#enlargertype 扩孔器类型
#enlargernumber 扩孔器编号
class Workcontent < ActiveRecord::Base
  attr_accessible :content, :coreleftlength, :corelength, :drillbit, :drilllength, :finishtime, :holeid, :pumppressure, :pumpquantity, :rotatespeed, :starttime, :tourreportid ,:upmore,:corename ,:coregrade , :corenumber ,:drillbittype,:drillbitnumber ,:enlargertype,:enlargernumber

  belongs_to :hole , :class_name=>"Hole" , :foreign_key=>"holeid"
  belongs_to :tourreport , :class_name=>"Tourreport" , :foreign_key=>"tourreportid"

  def self.getbytourereport(tourreportid)
    if tourreportid
      where("tourreportid=?",tourreportid).order("created_at desc")
    else
      order("created_at desc")
    end
  end
end
