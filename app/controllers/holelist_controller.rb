#encoding: utf-8
class HolelistController < ApplicationController

  def index
    @holes_list = Hole.unclosed.order('startdate desc')
    #@rigmachine = Rigmachine.unused
    #@drilltower = Drilltower.unused
    #@pump = Pump.unused

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holes }
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

  def create 
    @deployment = Deployment.new(params[:deployment])

    respond_to do |format|
      if @deployment.save
        format.html {redirect_to :action=>"index", notice:"钻孔配置成功"}
      end
    end
  end

end
