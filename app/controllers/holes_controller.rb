class HolesController < ApplicationController
  layout "boot"
  # GET /holes
  # GET /holes.json
  def index
    @holes = Hole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holes }
    end
  end

  # GET /holes/1
  # GET /holes/1.json
  #
  def show
    @hole = Hole.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hole }
      format.js { }
    end
  end

  # GET /holes/new
  # GET /holes/new.json
  def new
    @hole = Hole.new
    #@hole.contract = params[:contract_id]
    #logger.info "------------------------------------"
    #logger.info params[:contract_id]
    @contracts = Contract.unclosed
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hole }
    end
  end

  # GET /holes/1/edit
  def edit
    @hole = Hole.find(params[:id])
  end

  # POST /holes
  # POST /holes.json
  def create
    @hole = Hole.new(params[:hole])
    logger.info "the hole info is #{@hole}"
    logger.info "the contract id is #{params[:contract_id]}"
    #@hole.contract_id = params[:contract_id]
    respond_to do |format|
      if @hole.save
        format.html { redirect_to :controller=>'holes',:action=>'show',:id=>@hole.id , notice: 'Hole was successfully created.' }
        format.json { render json: @hole.contract, status: :created, location: @hole }
      else
        format.html { render action: "new" }
        format.json { render json: @hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /holes/1
  # PUT /holes/1.json
  def update
    @hole = Hole.find(params[:id])

    respond_to do |format|
      if @hole.update_attributes(params[:hole])
        format.html { redirect_to @hole, notice: 'Hole was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holes/1
  # DELETE /holes/1.json
  def destroy
    @hole = Hole.find(params[:id])
    @hole.destroy

    respond_to do |format|
      format.html { redirect_to holes_url }
      format.json { head :no_content }
    end
  end
end
