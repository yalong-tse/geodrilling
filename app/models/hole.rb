#encoding: utf-8
class Hole < ActiveRecord::Base
  #designapexangle, 设计顶角
  #actualapexangle, 实际终孔顶角
  #designdeep, 设计孔深
  #actualdeep, 实际孔深
  #designdiameter, 设计孔径
  #actualdiameter, 实际孔径
  #minearea ， 矿区
  #holenumber , 孔号
  #geologysituation, 地层情况
  #designcoreratio,设计岩心采取率
  #actualcoreratio, 实际岩心采取率
  #designbook , 设计书
  #drillingpurpose , 钻探目的
  #status , 钻孔状态, 0-待执行 1-执行中 , 2-终孔 , 3-停工， 4-续作 
  #说明：新建钻孔为待执行，钻孔配置完设备之后是执行中
  attr_accessible :designdeep,:actualdeep,:designdiameter,:actualdiameter,:finishdate, :startdate,:contract_id, :minearea,:holenumber,:geologysituation,:designapexangle,:actualapexangle,:designcoreratio,:actualcoreratio,:designbook,:drillingpurpose,:status,:remark,:attachment_id

  attr_reader :statusstr
  attr_reader :attachmentstr
  belongs_to :contract,:class_name=>"Contract" ,:foreign_key=>"contract_id"
  belongs_to :attachment,:class_name=>"Attachment",:foreign_key=>"attachment_id"

#  attr_accessor :statusstr

  # 设计孔径的字典表
  DIAMETERS =[['EQ','EQ'],['AQ[43/36]','AQ'],['BQ[56/46]','BQ'],['NQ[69.9/60.3]','NQ'],['HQ[89/77.8]','HQ'],['PQ[117/103]','PQ'],['SQ','SQ']] ;
  DRILLINGPURPOSE = [['金属矿'],['非金属矿'],['油气'],['水井'],['地热'],['煤田']] 

  # 选出所有已经关闭的钻孔
  scope :closed , :conditions=>{:status=>2}
  # 所有未配置的钻孔
  scope :undeployed , :conditions=>{:status=>0}

  scope :unclosed , :conditions=>"status=0 or status=1"


  def self.getbyholenumber(holenumber,contract_name)
    where("holenumber=? and contract.name=?",holenumber , contract_name)
  end

  # virtual attribute
  def statusstr
   result = ""
   case status
   when 0
     result = "待执行"
   when 1
     result = "执行中"
   when 2
     result = "终孔"
   when 3 
     result = "停工"
   when 4
     result = "续作"
   when nil
     result = "执行中"
   end
     result
  end

  def attachmentstr
    if attachment_id
      @attachment = Attachment.find(attachment_id)
      return "<a href='/holes/download?id=#{@attachment.id}' class='alert alert-success'>#{@attachment.filename}</a>"
    else
      return ""
    end 
  end

  # 保存附件的方法
  def save_file(file)
    if !file.nil?
      @attachment = Attachment.new
      rename = @attachment.save_att(file)
      logger.info("the rename is #{rename}");
      @attachment.save
      self.attachment_id = @attachment.id
    end
  end

  # 增加 as_json 方法
  def as_json(options={})
    super.as_json(options).merge({:statusstr=> statusstr}).merge({:attachmentstr=>attachmentstr})
  end

end
