#encoding: utf-8
class Pump < ActiveRecord::Base
  # 泥浆泵的model
  #manufacture 厂商
  #manufactureContact 厂商联系方式
  #orervallsize 外观尺寸
  #picture 图片
  #power  功率
  #pressure 压力
  #pumpDiameter 缸径
  #pumplineNumber 缸数
  #pumpmodel 型号
  #stroke 冲程
  #strokeTimes 冲次
  #traffic 流量
  #weight 重量
  #remark 备注
  #status 设备占用状态 boolean类型， 1,true 可用， 0，false--不可用
  #groupstatus  配组状态
  #rigmachine 配组的钻机的ID
  #name 设备名称
  #devicenumber 设备编号
  #discarddate 处理日期
  #discardtype 处理类型
  #discardreason 处理原因
  attr_accessible :manufacture, :manufactureContact, :overallsize, :picture, :power, :pressure, :pumpDiameter, :pumplineNumber, :pumpmodel, :remark, :stroke, :strokeTimes, :traffic, :weight, :name , :devicenumber, :status, :groupstatus ,:rigmachineid,:discarddate,:discardtype,:discardreason

  belongs_to :rigmachine , :class_name=>"Rigmachine" , :foreign_key=>"rigmachineid"
  belongs_to :attachment,:class_name=>"Attachment", :foreign_key=>"attachment_id" 

  scope :used ,:conditions=>{:status=>1}
  scope :unused , where("status=0 or status is null")
  scope :grouped , :conditions=>{:groupstatus=>1}
  scope :ungrouped ,:conditions=>{:groupstatus=>0}

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
