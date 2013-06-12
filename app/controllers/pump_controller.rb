#encoding: utf-8
class PumpController < ApplicationController
  layout "boot"
  def index
  end

  def create
    @pump = Pump.new(params[:pump])
    respond_to do |format|
      if @pump.save
        format.html {redirect_to :action=>"show", :id=>@pump , notice:"泥浆泵数据保存成功"}
        format.json {render json: @pump , status: :created , location: @pump}
      else
        format.html {render action:"new"}
        format.json {render json: @pump.errors , status: :unprocessable_entity}
      end
    end
  end

  def resume
    logger.info("==================================")
    @deviceresume = Deviceresume.pump(params[:devicenumber])
    logger.info( params[:devicenumber])
    respond_to do |format|
      format.html
    end 
  end

  def new
    @pump = Pump.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pump }
    end
  end

  def update
  end

  def show
    @pump = Pump.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @pump}
    end
  end
end
