class HolelistController < ApplicationController

  def index
    @holes_list = Hole.paginate(:page=>params[:page],:per_page=>5).order('startdate desc')
    @rigmachine = Rigmachine.unused
    @drilltower = Drilltower.unused
    @pump = Pump.unused

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holes }
    end
  end
end
