#encoding: utf-8
class GroupsController < ApplicationController
  layout "iframe_group", :only => [:index, :new]

  def index
    logger.info "-----------------#{params[:groupflag]}"
    @users = Group.find_by_groupflag(params[:groupflag]).users
    # @users1 = Group.find_by_groupflag(1).users # 项目经理
    # @users2 = Group.find_by_groupflag(2).users # 机长
    # @users3 = Group.find_by_groupflag(3).users # 班长
    # @users4 = Group.find_by_groupflag(4).users # 班员
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  def main
    
  end

  def new
    
  end
end
