#encoding: utf-8
module HolesUtils 

  # 根据用户信息获取钻孔ID的方法
  def getHoles
    holeids = []
    userid = session[:user_id]
    user = User.find(userid) if userid
    if user
      if(user.position==2 || user.position==3)
        logger.info "11111111111111111111"
        holeids = Deployment.where({:user_id =>user.id}).pluck(:hole_id)
        logger.info("the deploys is #{holeids.to_s}")
        return holeids
      elsif (user.position==1)
        logger.info "2222222222222222222222"
        contractids = Contract.where(:administrator_id =>user.id).pluck(:id)
        holeids = Hole.where("contract_id in (?)",contractids).pluck(:id)
      else
        logger.info "3333333333333333333333"
        #unclosed(:include=> :Contract, :conditions=>{ :department_id => user.department.id })
        return holeids
      end
    end


  end
end
