#encoding: utf-8
class DrilltowerController < ApplicationController

  def index
    respond_to do |format|
      format.html #index.html.erb
      format.json {render json: DrilltowersDatatable.new(view_context) }
    end
  end

  def discard 
    respond_to do |format|
      format.html #index.html.erb
      format.json {render json: DrilltowersdiscardDatatable.new(view_context) }
    end
  end

  def create
    @drilltower = Drilltower.new(params[:drilltower])
    @drilltower.save_file(params[:picture]) if params[:picture]
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

  def download
    @attachment = Attachment.find(params[:id]) if params[:id]
    filename ="#{@attachment.savepath}/#{@attachment.savefilename}"
    send_file filename if filename
  end

end
