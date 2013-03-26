class HolelistController < ApplicationController
  layout 'boot'
  def index
    @holes_list = Hole.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holes }
    end
  end
end
