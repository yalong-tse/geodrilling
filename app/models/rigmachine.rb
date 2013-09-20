#encoding: utf-8
class Rigmachine < ActiveRecord::Base
  # 钻机的Model
  # manufacture 厂商
  # manufactureContact  厂商联系方式
  # overallsize 外观尺寸
  # picture  图片
  # pipeDiameter 钻孔直径
  # remark 备注
  # rigpower 钻机功率
  # righoleDeep 钻孔深度
  # rigmodel 钻机型号
  # rigweight 钻机重量
  # rotatingSpeed 转速 
  # status 占用状态
  # name 名称
  # devicenumber  设备编号
  attr_accessible :manufacture, :manufactureContact, :overallsize, :picture, :pipeDiameter, :remark, :rigPower, :righoleDeep, :rigmodel, :rigweight, :rotatingSpeed,:name, :devicenumber, :status,:attachment_id

  belongs_to :attachment,:class_name=>"Attachment", :foreign_key=>"attachment_id" 
  has_one :pump , :foreign_key=>"rigmachineid"
  has_one :drilltower, :foreign_key=>"rigmachineid"
  
  scope :used , :conditions=>{:stauts=>1}

  # 所有未占用的钻机
  scope :unused , where("status=0 or status is null")

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

