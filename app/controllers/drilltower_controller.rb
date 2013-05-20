class DrilltowerController < ApplicationController
  layout "boot"
  def index
  end

  def create
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
  end
end
