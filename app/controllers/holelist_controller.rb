#encoding: utf-8
class HolelistController < ApplicationController

  include HolesUtils
  def index
    @holes_list = queryholes("id","desc").unclosed.order('status asc ,startdate desc')
    #@rigmachine = Rigmachine.unused
    #@drilltower = Drilltower.unused
    #@pump = Pump.unused
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  #钻孔的配置界面
  def deployment
    @deployment = Deployment.find_by_hole_id(params[:holeid]) if params[:holeid]
    @rigmachine = Rigmachine.unused
    @drilltower = Drilltower.unused
    @pump = Pump.unused

    @hole = Hole.find(params[:holeid]) if params[:holeid]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holes }
    end
  end

  # 钻孔配置的保存功能
  def create 
    holeid = params[:holeid]
    if(holeid)
      @deployment = Deployment.find_by_hole_id(holeid)
      if(@deployment.nil?)
        @deployment = Deployment.new
      end
    end
    rigid = params[:rigmachineid]
    pumpid = params[:pumpid]
    towerid = params[:drilltowerid]
    userid = params[:userid]

    #logger.info("the rigid is #{rigid}, the pumpid is #{pumpid}, the towerid is #{towerid}");
    @deployment.hole_id = holeid
    @deployment.pump_id = pumpid
    @deployment.rigmachine_id = rigid
    @deployment.drilltower_id = towerid
    @deployment.user_id = userid
    hole = Hole.find(params[:holeid]) if params[:holeid]
    # 更改钻孔的状态为"正在执行"
    hole.status = 1
    hole.save

    respond_to do |format|
      if @deployment.save
        format.html {redirect_to :action=>"index", notice:"钻孔配置成功"}
      end
    end
  end

end
