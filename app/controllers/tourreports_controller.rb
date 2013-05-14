class TourreportsController < ApplicationController
  layout 'boot'
  # GET /tourreports
  # GET /tourreports.json
  def index
    @tourreports = Tourreport.paginate(:page=>params[:page],:per_page=>5).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tourreports }
    end
  end

  def indexformodify
    @tourreports = Tourreport.paginate(:page=>params[:page],:per_page=>5).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tourreports }
    end
  end

  # GET /tourreports/1
  # GET /tourreports/1.json
  def show
    @tourreport = Tourreport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tourreport }
    end
  end

  # GET /tourreports/new
  # GET /tourreports/new.json
  def new
    @tourreport = Tourreport.new
    @holes = Hole.unclosed

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tourreport }
    end
  end

  # GET /tourreports/1/edit
  def edit
    @tourreport = Tourreport.find(params[:id])
  end

  # POST /tourreports
  # POST /tourreports.json
  def create
    @tourreport = Tourreport.new(params[:tourreport])

    respond_to do |format|
      if @tourreport.save
        format.html { redirect_to @tourreport, notice: 'Tourreport was successfully created.' }
        format.json { render json: @tourreport, status: :created, location: @tourreport }
      else
        format.html { render action: "new" }
        format.json { render json: @tourreport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tourreports/1
  # PUT /tourreports/1.json
  def update
    @tourreport = Tourreport.find(params[:id])

    respond_to do |format|
      if @tourreport.update_attributes(params[:tourreport])
        format.html { redirect_to @tourreport, notice: 'Tourreport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tourreport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tourreports/1
  # DELETE /tourreports/1.json
  def destroy
    @tourreport = Tourreport.find(params[:id])
    @tourreport.destroy

    respond_to do |format|
      format.html { redirect_to tourreports_url }
      format.json { head :no_content }
    end
  end
end
