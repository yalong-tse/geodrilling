class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :login_required?

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied. You are not authorized to access the requested page."
    redirect_to root_path and return
  end
  
  protected
  
  def login_required?
    unless session[:user_id]
      flash[:notice]="You need to log in first."
      redirect_to root_url #, :notice => "You need to log in first."
      return false
    else
      return true
    end
  end

  # derive the model name from the controller. e.g. UsersController will return User
  def self.permission
    return name = self.name.gsub('Controller','').singularize.split('::').last.constantize.name rescue nil
  end

  def self.permission_ZN
    name = self.name.gsub('Controller','').singularize.split('::').last.constantize.name.downcase rescue nil
    I18n.t "controllers.#{name}"
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  # load the permissions for the current user so that UI can be manipulated
  def load_permissions
    @current_permissions = current_user.role.permissions.collect{|i| [i.subject_class, i.action]}
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
