class UsersController < ApplicationController
  layout 'iframe', :except => [:main,:destroy_multiple]

  before_filter :load_department, :except => :main

  def main
    @department = Department.roots.first
    @departments = Department.arrange
    respond_to do |format|
      format.html
      format.js
    end
  end

  # DELETE departments/1/users/destroy_multiple
  def destroy_multiple
    begin
      User.destroy(params[:users])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = t 'activerecord.errors.messages.notfound', :model => User.model_name.human
      redirect_to department_users_url
      return
    end
    respond_to do |format|
      format.html { redirect_to department_users_url }
    end
  end
  
  # GET departments/1/users
  # GET departments/1/users.json
  def index
    @users = @department.users

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET departments/1/users/1
  # GET departments/1/users/1.json
  def show
    @user = @department.users.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET departments/1/users/new
  # GET departments/1/users/new.json
  def new
    @user = @department.users.build
    @roles = Role.all
    @user_roles = @user.roles.collect{ |r| r.id }
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET departments/1/users/1/edit
  def edit
    @user = @department.users.find(params[:id])
    @roles = Role.all
    @user_roles = @user.roles.collect{ |r| r.id }
  end

  # POST departments/1/users
  # POST departments/1/users.json
  def create
    @user = @department.users.build(params[:user])
    User.set_default_password(@user) if params[:user][:isappuser]
    respond_to do |format|
      if @user.save
        # format.html { redirect_to [@department, @user], notice: I18n.t('activerecord.successful.messages.created', :model => @user.class.model_name.human) }
        format.html { redirect_to department_users_url, notice: t('activerecord.successful.messages.created', :model => @user.class.model_name.human) }
        format.json { render json: @user, status: :created, location: @user }
      else
        @roles = Role.all
        @user_roles = @user.roles.collect{|r| r.id}
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT departments/1/users/1
  # PUT departments/1/users/1.json
  def update
    # logger.debug "********************#{params[:ismodifypw]}"
    # logger.debug "*********oldpassword***********#{params[:oldpassword]}"
    @user = @department.users.find(params[:id])
    unless params[:ismodifypw] == '1'
      User.set_default_password(@user) if params[:user][:isappuser]
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        # format.html { redirect_to [@department, @user], notice: I18n.t('activerecord.successful.messages.updated', :model => @user.class.model_name.human) }
        format.html { redirect_to department_users_url, notice: t('activerecord.successful.messages.updated', :model => @user.class.model_name.human) }
        format.json { head :no_content }
        format.js {}
      else
        @roles = Role.all
        @user_roles = @user.roles.collect{|r| r.id}
        # flash.now[:error] = "ceshi"
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # DELETE departments/1/users/1
  # DELETE departments/1/users/1.json
  def destroy
    @user = @department.users.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to department_users_url }
      format.json { head :no_content }
    end
  end

  private
  
  def load_department
    @department = Department.find(params[:department_id])
  end

end
