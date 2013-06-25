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
  attr_accessible :content, :finishdate, :name,:projectname,:buyerparty,:projectaddr,:remark,:contractno,:owner, :signdate, :startdate,:finishdate, :status,:fundsource,:contractamount
  has_many :holes

  # 待归档的合同
  scope :wait_archive, :conditions => {:status=>2}
  scope :unclosed , :conditions => {:status=>1}

  QUERY_CONDITIONS=[["合同名称","name"],["项目名称","projectname"],["业主","owner"],["乙方","buyerparty"],["合同金额","contractamount"]]

end
