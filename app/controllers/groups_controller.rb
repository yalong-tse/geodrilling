#encoding: utf-8
class GroupsController < ApplicationController
  layout "iframe_group", :only => [:index, :new, :deploy]

  def create
    Group.save_users(params[:userids], params[:groupflag])
    respond_to do |format|
      format.js
    end
  end

  def saveleader
    User.save_leader(params[:userids], params[:leaderid])
    respond_to do |format|
      format.js
    end
  end

  def index
    @group = Group.find_by_groupflag(params[:groupflag])
    @users = @group.users

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # 配组
  def deploy
    a = params[:groupflag].to_i + 1
    @user = User.find(params[:user_id])
    @group = Group.find_by_groupflag(a)
    @users = @group.users
    logger.debug "-------------#{a}"
    respond_to do |format|
      format.html # deploy.html.erb
    end
  end

  def main
    
  end

  def new
    @group = Group.find_by_groupflag(params[:groupflag])
    # 找到所有的没有分组的用户及他们所属的部门
    @users = User.get_users_for_groups

  end

  def groupflag
    params[:groupflag]
  end

  helper_method :groupflag
end
