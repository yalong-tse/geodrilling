#encoding: utf-8
module ContractsUtils 

  # 查询合同,返回合同的集合
  def querycontracts(sort_column, sort_direction)
    userid = session[:user_id]
    user = User.find(userid) if userid
    if user
      # 机长或者班长项目经理所管理的那个合同
      contractids = []
      if(user.position==2)
        admin = user.leader
        contracts = Contract.where(:administrator_id=>admin.id).order("#{sort_column} #{sort_direction}") if admin
        return contracts
      elsif (user.position==1)
        # 项目经理看自己的合同
        contracts = Contract.where(:administrator_id=>user.id).order("#{sort_column} #{sort_direction}")
        return contracts
      else
        # 其他人看所有的合同，暂时不区分自己看自己的合同
        contracts = Contract.order("#{sort_column} #{sort_direction}")
        return contracts
      end
    end

  end
end
