class PumpController < ApplicationController
  layout "boot"
  def index
  end

  def create
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
  end
end
