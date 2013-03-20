class HolelistController < ApplicationController
  layout 'boot'
  def index
    @holes = Hole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holes }
    end
  end
end
