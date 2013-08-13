class HolelistController < ApplicationController

  def index
    @holes_list = Hole.unclosed.order('startdate desc')
    @rigmachine = Rigmachine.unused
    @drilltower = Drilltower.unused
    @pump = Pump.unused

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holes }
    end
  end

  #钻孔的配置界面
  def deployment
    @deployment = Deployment.find_by_hole_id(params[:holeid]) if params[:holeid]
    @hole = Hole.find(params[:holeid]) if params[:holeid]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holes }
    end

  end
end
