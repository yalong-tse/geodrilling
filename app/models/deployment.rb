# utf-8
# 钻孔的配置表实体
# 主要配置机长和 泥浆泵、钻机、钻塔等信息
class Deployment < ActiveRecord::Base
  attr_accessible :hole,:pump,:rigmachine,:drilltower,:user, :hole_id, :pump_id,:rigmachine_id,:drilltower_id, :user_id

  belongs_to :hole, :class_name=>"Hole", :foreign_key=>"hole_id"
  belongs_to :pump, :class_name=>"Pump", :foreign_key=>"pump_id"
  belongs_to :rigmachine, :class_name=>"Rigmachine", :foreign_key=>"rigmachine_id"
  belongs_to :drilltower, :class_name=>"Drilltower", :foreign_key=>"drilltower_id"
  belongs_to :user, :class_name=>"User", :foreign_key=>"user_id"
  
  # attr_accessible :title, :body

  #根据钻孔id进行查询
  #def self.getDeployByHoleId(holeid)
    #where("hole_id=?",holeid).take
  #  find_by hole_id: holeid
  #end


end
