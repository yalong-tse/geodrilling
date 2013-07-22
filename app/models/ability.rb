class Ability
  include CanCan::Ability

  def initialize(user)
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
