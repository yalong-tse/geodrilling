# encoding: utf-8
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.account == 'admin'  # admin 用户不属于任何部门
      can :manage, :all
    end
    user_permission = []
    user.roles.each do |role|
      role.permissions.each do |permission|
        user_permission << permission
      end
    end

    user_permission.uniq.each do |permission|
      if permission.subject_class == "all"
        can permission.action.to_sym, permission.subject_class.to_sym
      else
        can permission.action.to_sym, permission.subject_class.constantize
      end
    end
  end
  

end
