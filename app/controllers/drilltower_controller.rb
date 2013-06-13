#encoding: utf-8
class DrilltowerController < ApplicationController

  def index
  end

  def create
    @drilltower = Drilltower.new(params[:drilltower])
    respond_to do |format|
      if @drilltower.save
        format.html {redirect_to :action=>"show", :id=>@drilltower , notice: '钻塔数据成功保存'}
        format.json {render json: @drilltower , status: :created, location: @drilltower}
      else
        format.html {render action: "new"}
        format.json {render json: @drilltower.errors, status: :unprocessable_entity}
      end
    end

  end

  def new
    @drilltower = Drilltower.new 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drilltower }
    end
  end

  def update
  end

  def show
    @drilltower = Drilltower.find(params[:id])

    respond_to do |format|
      format.html 
      format.json {render json: @drilltower}
    end
  end

  def resume
    logger.info("==================================")
    @deviceresume = Deviceresume.drilltower(params[:devicenumber])
    logger.info( params[:devicenumber])
    respond_to do |format|
      format.html
    end 
  end

end
