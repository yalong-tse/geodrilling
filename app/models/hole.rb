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
  #status , 钻孔状态, 1-执行中 , 2-终孔 , 3-停工， 4-续作
  attr_accessible :designdeep,:actualdeep,:designdiameter,:actualdiameter,:finishdate, :startdate,:contract, :minearea,:holenumber,:geologysituation,:designapexangle,:actualapexangle,:designcoreratio,:actualcoreratio,:designbook,:drillingpurpose,:status,:remark

  attr_reader :statusstr
  belongs_to :contract,:class_name=>"Contract" ,:foreign_key=>"contract_id"

#  attr_accessor :statusstr

  # 设计孔径的字典表
  DIAMETERS =[['E','E'],['A','A'],['B','B'],['N','N'],['H','H'],['P','P'],['S','S']] ;
  DRILLINGPURPOSE = [['金属矿'],['非金属矿'],['油气'],['水井'],['地热'],['煤田']] 

  # 选出所有已经关闭的钻孔
  scope :closed , :conditions=>{:status=>2}
  scope :unclosed , :conditions=>{:status=>1}

  def self.getbyholenumber(holenumber,contract_name)
    where("holenumber=? and contract.name=?",holenumber , contract_name)
  end
  # virtual attribute
  def statusstr
   result = ""
   case status
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

  # 增加 as_json 方法
  def as_json(options={})
    super.as_json(options).merge({:statusstr=> statusstr})
  end

end
