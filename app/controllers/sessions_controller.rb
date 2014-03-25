class SessionsController < ApplicationController
  layout 'base'
  
  skip_before_filter :login_required?, :only => [:new, :create]

  def new
  end

  def create
    if params[:account].blank?
      redirect_to root_url, :alert => t("prompt.invalid.account")
      return false
    end

    if params[:password].blank?
      redirect_to root_url, :alert => t("prompt.invalid.password")
      return false
    end

    user = User.authenticate(params[:account], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to contracts_url
    else
      flash.now.alert = t("prompt.invalid.login")
      render "new"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
