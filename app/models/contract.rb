#encoding: utf-8
class Contract < ActiveRecord::Base
  #projectname,项目名称
  #buyparty, 乙方
  #owner,业主
  #contractno :合同编号
  #deadlinedate ,合同截止日期
  #remark , 备注
  #projectaddr, 项目地址
  #fundsource ,资金来源
  #status的四种状态, 0-待执行,1-正在执行,2-已经完成,3-已经归档，只有已经完成的合同可以归档。
  attr_accessible :content, :finishdate, :name,:projectname,:buyerparty,:projectaddr,:remark,:contractno,:owner, :signdate, :startdate,:finishdate, :status,:fundsource,:contractamount,:attachment_id
  has_many :holes

  #合同的附件
  belongs_to :attachment,:class_name=>"Attachment", :foreign_key=>"attachment_id" 

  # 待归档的合同
  scope :wait_archive, :conditions => {:status=>2}
  scope :unclosed , :conditions => "status=0 or status=1" 
  scope :archived, :conditions=>{:status=>3}
  scope :closed, :conditions=>{:status=>2}

  STATUS=[["待执行",0], ["执行中",1],["已完成",2],["已经归档",3]]

  QUERY_CONDITIONS=[["合同名称","name"],["项目名称","projectname"],["业主","owner"],["乙方","buyerparty"],["合同金额","contractamount"]]

  def save_file(file)
    if !file.nil?
      @attachment = Attachment.new
      rename = @attachment.save_att(file)
      logger.info("the rename is #{rename}");
      @attachment.save
      self.attachment_id = @attachment.id
    end
  end

  def self.close(contractno)
    logger.info("the contractno is #{contractno}");
    @contract = Contract.where(:contractno=>contractno).first
#    @contract.status=3;
#    @contract.save
    @contract.update_attribute(:status,2)
  end

  # 实例的关闭方法
  def close
    update_attribute(:status,2)
  end

  # 实例的归档方法
  def archive
    update_attribute(:status,3)
  end

  def self.getowner
    Contract.select(:owner).uniq
  end
  
  def self.getbuyer
    Contract.select(:buyerparty).uniq
  end

end
