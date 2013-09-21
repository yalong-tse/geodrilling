#encoding: utf-8
class RigmachineController < ApplicationController

  def index
    respond_to do |format|
      format.html #index.html.erb
      format.json {render json: RigmachinesDatatable.new(view_context) }
    end
  end

  def discard 
    respond_to do |format|
      format.html #index.html.erb
      format.json {render json: RigmachinesdiscardDatatable.new(view_context) }
    end
  end

  def create
    @rigmachine = Rigmachine.new(params[:rigmachine])
    @rigmachine.save_file(params[:picture]) if params[:picture]
    logger.info "-----------------------------"
    respond_to do |format|
      if @rigmachine.save
        format.html {redirect_to :action=>"show" , :id=>@rigmachine , notice:"钻机数据保存成功"}
        format.json {render json: @rigmachine , status: :created , location: @rigmachine}
      else
        format.html {render :action=>"new"}
        format.json {render json: @rigmachine.errors , status: :unprocessable_entity}
      end
    end
  end

  def new
    @rigmachine = Rigmachine.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rigmachine }
    end
  end

  def update
  end

  def resume
    logger.info("==================================")
    @deviceresume = Deviceresume.rigmachine(params[:devicenumber])
    logger.info( params[:devicenumber])
    respond_to do |format|
      format.html
    end 
  end

  def show
    @rigmachine = Rigmachine.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @rigmachine}
    end
  end

  def download
    @attachment = Attachment.find(params[:id]) if params[:id]
    filename ="#{@attachment.savepath}/#{@attachment.savefilename}"
    send_file filename if filename
  end

end
