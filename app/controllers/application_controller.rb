#encoding: utf-8
class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :login_required?
  after_filter :add_flash_to_header

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "访问拒绝. 您未授权访问该页面."
    redirect_to root_path and return
  end
  
  protected

  def add_flash_to_header
    # only run this in case it's an Ajax request.
    return unless request.xhr?

    # add different flashes to header
    response.headers['X-Flash-Error'] = flash[:error] unless flash[:error].blank?
    response.headers['X-Flash-Warning'] = flash[:warning] unless flash[:warning].blank?
    response.headers['X-Flash-Notice'] = flash[:notice] unless flash[:notice].blank?
    response.headers['X-Flash-Message'] = flash[:message] unless flash[:message].blank?

    # make sure flash does not appear on the next page
    flash.discard
  end

  def login_required?
    unless session[:user_id]
      flash[:notice]="请先登录系统."
      redirect_to root_url #, :notice => "You need to log in first."
      return false
    else
      @login_user = User.find(session[:user_id])
      return true
    end
  end

  # derive the model name from the controller. e.g. UsersController will return User
  def self.permission
    return name = self.name.gsub('Controller','').singularize.split('::').last.constantize.name rescue nil
  end
  
  # 此方法不再使用 20130711 
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
