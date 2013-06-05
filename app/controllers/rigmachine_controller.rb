#encoding: utf-8
class RigmachineController < ApplicationController
  layout "boot"
  def index
  end

  def create
    @rigmachine = Rigmachine.new(params[:rigmachine])
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
end
