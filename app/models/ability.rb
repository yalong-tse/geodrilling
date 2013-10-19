# encoding: utf-8
class Ability
  include CanCan::Ability

  def initialize(user)

    # 部门管理（1. 查看；2. 编辑）
    alias_action :main, :show, :dynamic_tree, :to => :department_read
    alias_action :department_read, :create, :edit, :update, :destroy, :to => :department_modify

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
