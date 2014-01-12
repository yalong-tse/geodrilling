#encoding: utf-8
class Drilltower < ActiveRecord::Base
  # 钻塔的model类
  # basePlatformsize  底盘尺寸
  # deep  深度
  # effectiveload  有效载荷
  # height  高度
  # manufacture  厂商
  # manufactureContact  厂商联系人
  # model 型号 
  # picture 图片
  # pipequantityAndLength  提升钻杆根数与长度， 
  # remark 备注
  # sheaveQuantity 滑车组数与减轻负荷倍数， 去掉
  # topsize 顶宽尺寸
  # weight 重量
  # workbenchHeight 工作台高度
  # name 名称
  # devicenumber 设备编号
  # status 占用状态该字段为boolean ,  nil --可用， true 可用， false不用, 1-可用，0-不可用 
  # groupstatus  设备配组状态
  # rigmachine 配组的钻机ID
  # discarddate 处理日期
  # discardtype 处理类型
  # discardreason 处理原因
  # officialcode 单位编码
  attr_accessible :basePlatformsize, :deep, :effectiveload, :height, :manufacture, :manufactureContact, :model, :picture, :pipequantityAndLenght, :remark, :sheaveQuantity, :topsize, :weight, :workbenchHeight, :name, :devicenumber , :status, :groupstatus, :rigmachineid,:attachment,:attachment_attributes,:discarddate,:discardtype,:discardreason, :officialcode


  belongs_to :rigmachine ,:class_name=>"Rigmachine", :foreign_key=>"rigmachineid"
  belongs_to :attachment,:class_name=>"Devicephoto", :foreign_key=>"attachment_id" 
  accepts_nested_attributes_for :attachment , :allow_destroy=>true

  scope :used , :conditions=>{ :status=>1}
  #未占用的钻塔
  scope :unused , where("status=0 or status is null") 
  scope :grouped , :conditions=>{:groupstatus=>1}
  scope :ungrouped , :conditions=>{:groupstatus=>0}


  # 该方法已经没有用了，修改为使用 paperclip , paperclip model is devicephoto
  def save_file(file)
    if !file.nil?
      @attachment = Attachment.new
      rename = @attachment.save_att(file)
      logger.info("the rename is #{rename}");
      @attachment.save
      self.attachment_id = @attachment.id
    end
  end

end
