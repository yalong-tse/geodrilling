#encoding: utf-8
module HolesUtils 

  # 根据用户信息获取钻孔ID的方法
  def getHoles
    holeids = []
    userid = session[:user_id]
    user = User.find(userid) if userid
    if user
      # 机长或者班长进来查看自己的孔
      if(user.position==2 || user.position==3)
        #logger.info "11111111111111111111"
        holeids = Deployment.where({:user_id =>user.id}).pluck(:hole_id)
        #logger.info("the deploys is #{holeids.to_s}")
        return holeids
      elsif (user.position==1)
        # 项目经理
        contractids = Contract.where(:administrator_id =>user.id).pluck(:id)
        holeids = Hole.where("contract_id in (?)",contractids).pluck(:id)
        holeids2 = Deployment.where({:user_id =>user.id}).pluck(:hole_id)
        holeids += holeids2
        #logger.info holeids.to_s
        return holeids
      else
        return holeids
      end
    end
  end

  # 查询钻孔,返回钻孔的集合
  def queryholes(sort_column, sort_direction)
    userid = session[:user_id]
    user = User.find(userid) if userid
    if user
      # 机长或者班长进来查看自己的孔
      holeids = []
      if(user.position==2 || user.position==3)
        holeids = Deployment.where({:user_id =>user.id}).pluck(:hole_id)
        holes = Hole.where("id in (?)", holeids).order("#{sort_column} #{sort_direction}")
        return holes
      elsif (user.position==1)
        # 项目经理
        contractids = Contract.where(:administrator_id =>user.id).pluck(:id)
        holeids = Hole.where("contract_id in (?)",contractids).pluck(:id)
        holeids2 = Deployment.where({:user_id =>user.id}).pluck(:hole_id)
        holeids += holeids2
        holes = Hole.where("id in (?)", getHoles).order("#{sort_column} #{sort_direction}")
        return holes
      else
        holes = Hole.order("#{sort_column} #{sort_direction}")
        return holes
      end
    end
  end

  # 查询钻孔,返回钻孔的集合
  def findholes(userid)
    user = User.find(userid) if userid
	logger.info user.position
    if user
      # 机长或者班长进来查看自己的孔
      holeids = []
      if(user.position==2 || user.position==3)
        holeids = Deployment.where({:user_id =>userid}).pluck(:hole_id)
        holes = Hole.where("id in (?)", holeids).order("holenumber asc")
        return holes
      elsif (user.position==1)
        # 项目经理
        contractids = Contract.where(:administrator_id =>user.id).pluck(:id)
        holeids = Hole.where("contract_id in (?)",contractids).pluck(:id)
        holeids2 = Deployment.where({:user_id =>user.id}).pluck(:hole_id)
        holeids += holeids2
        holes = Hole.where("id in (?)", getHoles).order("holenumber asc")
        return holes
      else
        holes = Hole.order("holenumber asc")
        return holes
      end
    end
  end

end
