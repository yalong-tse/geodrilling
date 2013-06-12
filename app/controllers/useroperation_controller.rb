class UseroperationController < ApplicationController
  layout "boot"

  def index
    @useroperations = Useroperation.all
    @useroperation = Useroperation.new

    respond_to do |format|
      format.html 
      format.json {render json: @useroperation}
    end 
  end

  def show
  end
end
