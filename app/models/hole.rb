#encoding: utf-8
class Hole < ActiveRecord::Base
  #designapexangle, 设计顶角
  #actualapexangle, 实际终孔顶角
  #designpositionangle 设计方位角
  #actualpositionangle 实际方位角
  #designdeep, 设计孔深
  #actualdeep, 实际孔深
  #designdiameter, 设计孔径
  #actualdiameter, 实际孔径
  #minearea ， 矿区
  #holenumber , 孔号
  #geologysituation, 地层情况
  #designcoreratio,设计岩心采取率
  #actualcoreratio, 实际岩心采取率
  #designminecoreratio , 设计矿心采取率
  #actualminecoreratio , 实际矿心采取率
  #designbook , 设计书
  #drillingpurpose , 钻探目的
  #status , 钻孔状态, 0-待执行 1-执行中 , 2-终孔 , 3-停工， 4-续作 
  #opennoticeatt_id 开孔通知书
  #closenoticeatt_id 终孔通知书
  #curvetableatt_id 钻孔弯曲度测量记录表
  #measuretableatt_id 钻具丈量及孔深误差记录表
  #coretransferdoc_id 岩矿心移交验收单
  #tourreporttransferdoc_id 原始记录报表移交清单
  #qualitychecktable_id 钻孔质量验收评定表
  #tourreporttabledoc_id 钻孔班报表
  #钻孔关闭的时候增加
  #unitprice 单价
  #output 产值  =  单价 x 孔深
  #outerflag 是否外协
  #unit_price 钻孔的综合单价
  #说明：新建钻孔为待执行，钻孔配置完设备之后是执行中
  attr_accessible :designdeep,:actualdeep,:designdiameter,:actualdiameter,:finishdate, :startdate,:contract_id, :minearea,:holenumber,:geologysituation,:designapexangle,:actualapexangle,:designcoreratio,:actualcoreratio,:designbook,:drillingpurpose,:status,:remark, :designminecoreratio, :actualminecoreratio, :attachment_id, :designpositionangle, :actualpositionangle,:attachment, :attachment_attributes, :opennotice, :opennotice_attributes, :closenotice, :closenotice_attributes, :curvetable , :curvetable_attributes ,:measuretable, :measuretable_attributes, :coretransferdoc , :coretransferdoc_attributes, :tourreporttransferdoc, :tourreporttransferdoc_attributes, :qualitychecktable, :qualitychecktable_attributes, :tourreporttabledoc, :tourreporttabledoc_attributes,:unitprice,:output,:outerflag, :unit_price

  attr_reader :statusstr
  #attr_reader :attachmentstr
  belongs_to :contract,:class_name=>"Contract" ,:foreign_key=>"contract_id"
  belongs_to :attachment,:class_name=>"Holeassets",:foreign_key=>"attachment_id"
  belongs_to :opennotice, :class_name=>"Holeassets" , :foreign_key=>"opennoticeatt_id"
  belongs_to :closenotice, :class_name=>"Holeassets" , :foreign_key=>"closenoticeatt_id"
  belongs_to :curvetable, :class_name=>"Holeassets" , :foreign_key=>"curvetableatt_id"
  belongs_to :measuretable, :class_name=>"Holeassets" , :foreign_key=>"measuretableatt_id"
  belongs_to :coretransferdoc, :class_name=>"Holeassets" , :foreign_key=>"coretransferdoc_id"
  belongs_to :tourreporttransferdoc, :class_name=>"Holeassets" , :foreign_key=>"tourreporttransferdoc_id"
  belongs_to :qualitychecktable, :class_name=>"Holeassets" , :foreign_key=>"qualitychecktable_id"
  belongs_to :tourreporttabledoc, :class_name=>"Holeassets" , :foreign_key=>"tourreporttabledoc_id"

  #has_many :holeassets , :dependent=>:destroy , :class_name=>"Holeassets"
  accepts_nested_attributes_for :attachment, :allow_destroy=>true
#  attr_accessor :statusstr

  # 设计孔径的字典表
  #DIAMETERS =[['EQ','EQ'],['AQ[43/36]','AQ'],['BQ[56/46]','BQ'],['NQ[69.9/60.3]','NQ'],['HQ[89/77.8]','HQ'],['PQ[117/103]','PQ'],['SQ','SQ']] ;
  #DRILLINGPURPOSE = [['金属矿'],['非金属矿'],['油气'],['水井'],['地热'],['煤田']] 

  # 选出所有已经关闭的钻孔
  scope :closed, :conditions=>{:status=>2}
  # 所有未配置的钻孔
  scope :undeployed, :conditions=>{:status=>0}

  scope :unclosed, :conditions=>"status=0 or status=1"


  def self.getbyholenumber(holenumber,contract_name)
    where("holenumber=? and contract.name=?",holenumber , contract_name)
  end


  # 根据合同编号得到所有的钻孔
  def self.getbycontractid(contractid)
    where("contract_id=?",contractid);
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
      #logger.info("the rename is #{rename}");
      @attachment.save
      self.attachment_id = @attachment.id
    end
  end

  #关孔操作时其他附件的保存办法,在参数中一起传递过来
  def save_closefile(opennotice,closenotice,curvetable,measuretable,coretransfer,tourreporttransfer,qualitycheck,tourreporttable)
    if(!opennotice.nil?)
      opennoticeatt = Attachment.new
      opennoticeatt.save_att(opennotice)
      opennoticeatt.save
      self.opennoticeatt_id = opennoticeatt.id
    end

    if(!closenotice.nil?)
      closenoticeatt = Attachment.new
      closenoticeatt.save_att(closenotice)
      closenoticeatt.save
      self.closenoticeatt_id = closenoticeatt.id
    end

    if(!curvetable.nil?)
      curvetableatt = Attachment.new
      curvetableatt.save_att(curvetable)
      curvetableatt.save
      self.curvetableatt_id = curvetableatt.id
    end

    if(!measuretable.nil?)
      measuretableatt = Attachment.new
      measuretableatt.save_att(measuretable)
      measuretableatt.save
      self.measuretableatt_id = measuretableatt.id
    end

    if(!coretransfer.nil?)
      coretransferatt = Attachment.new
      coretransferatt.save_att(coretransfer)
      coretransferatt.save
      self.coretransferdoc_id = coretransferatt.id
    end

    if(!tourreporttransfer.nil?)
      tourreporttransferatt = Attachment.new
      tourreporttransferatt.save_att(tourreporttransfer)
      tourreporttransferatt.save
      self.tourreporttransferdoc_id = tourreporttransferatt.id
    end

    if(!qualitycheck.nil?)
      qualitycheckatt = Attachment.new
      qualitycheckatt.save_att(qualitycheck)
      qualitycheckatt.save
      self.qualitychecktable_id = qualitycheckatt.id
    end

    if(!tourreporttable.nil?)
      tourreporttableatt= Attachment.new
      tourreporttableatt.save_att(tourreporttable)
      tourreporttableatt.save
      self.tourreporttabledoc_id = tourreporttableatt.id
    end
    # 设置钻孔状态
    self.status=2

  end


  # 增加 as_json 方法
  def as_json(options={})
    super.as_json(options).merge({:statusstr=> statusstr}).merge({:attachmentstr=>attachmentstr})
  end


end
