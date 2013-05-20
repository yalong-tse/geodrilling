class RigmachineController < ApplicationController
  layout "boot"
  def index
  end

  def create
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

  def show
  end
end
