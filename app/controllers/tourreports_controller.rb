#encoding: utf-8
class TourreportsController < ApplicationController

  # GET /tourreports
  # GET /tourreports.json
  def index
#    @tourreports = Tourreport.paginate(:page=>params[:page],:per_page=>5).all
    logger.info("the hole id is #{params[:holeid]}")
    @holeid = params[:holeid]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: TourreportsDatatable.new(view_context,params[:holeid]) }
    end
  end

  def indexformodify
    #@tourreports = Tourreport.paginate(:page=>params[:page],:per_page=>5).all

    @holeid = params[:holeid]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: TourreportsmodifyDatatable.new(view_context,params[:holeid]) }
    end
  end

  # GET /tourreports/1
  # GET /tourreports/1.json
  # 以表格的样式展示班报
  def show
    @tourreport = Tourreport.find(params[:id])
    #@deployment = Deployment.find(:first,:conditions=>["hole_id=?",params[:id]])
    @contentarr = Workcontent.find(:all, :conditions=>["tourreportid=?",params[:id]])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tourreport }
    end
  end

  # GET /tourreports/new
  # GET /tourreports/new.json
  def new
    @tourreport = Tourreport.new
    @hole = Hole.find(params[:holeid])
    #@holes = Hole.unclosed
    @deployment = Deployment.find_by_hole_id(params[:holeid]) if params[:holeid]
    @contentarr = [Workcontent.new]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tourreport }
    end
  end

  # GET /tourreports/1/edit
  def edit
    @tourreport = Tourreport.find(params[:id])
    @contentarr = Workcontent.find(:all, :conditions=>["tourreportid=?",params[:id]])

    @hole = Hole.find(@tourreport.holeid)
    #@holes = Hole.unclosed
    @deployment = Deployment.find_by_hole_id(@tourreport.holeid) if @tourreport.holeid 
    logger.info "==========================="
    logger.info @deployment
  end

  # POST /tourreports
  # POST /tourreports.json
  def create
    @tourreport = Tourreport.new(params[:tourreport])

    #来自大平台的填报
    @tourreport.source=1

    thehole = Hole.find(@tourreport.holeid) if @tourreport.holeid 
    thehole.actualdeep = @tourreport.currentdeep 
    thehole.save

    # 工作内容的保存
    if params[:workcontent_starttime]
      params[:workcontent_starttime].each_index do |i|
        workcontent = Workcontent.new
        workcontent.starttime = params[:workcontent_starttime][i]
        workcontent.finishtime = params[:workcontent_finishtime][i]
        workcontent.content = params[:workcontent][i]
        workcontent.upmore = params[:workcontent_upmore][i]
        workcontent.drilllength = params[:workcontent_drilllength][i]
        workcontent.holedeep = params[:workcontent_holedeep][i]
        #workcontent.corename = params[:workcontent_corename][i]
        #workcontent.coregrade = params[:workcontent_coregrade][i]
        workcontent.corenumber = params[:workcontent_corenumber][i]
        workcontent.corelength = params[:workcontent_corelength][i]
        workcontent.coreleftlength = params[:workcontent_coreleftlength][i]
        workcontent.drillbit = params[:workcontent_drillbit][i]
        workcontent.drillbittype = params[:workcontent_drillbittype][i]
        workcontent.drillbitnumber = params[:workcontent_drillbitnumber][i]
        workcontent.enlargernumber = params[:workcontent_enlargernumber][i]
        workcontent.enlargertype = params[:workcontent_enlargertype][i]
        workcontent.pumppressure = params[:workcontent_pumppressure][i]
        workcontent.rotatespeed = params[:workcontent_rotatespeed][i]
        workcontent.pumpquantity = params[:workcontent_pumpquantity][i]
        workcontent.mudamount = params[:workcontent_mudamount][i]

        workcontent.holeid = params[:tourreport][:holeid]
        workcontent.tourreport = @tourreport
        workcontent.save

        logger.info params[:workcontent_starttime][i]
        logger.info(params[:workcontent][i])
        logger.info(params[:workcontent_finishtime][i])
      end  
    end

    respond_to do |format|
      if @tourreport.save
        format.html { redirect_to @tourreport, notice: '班报成功保存' }
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

  # 查询班报报表的内容，支持条件查询
  def holesreport
    if params[:holenumber]
      @holes = Hole.where("holenumber like ?", "%#{params[:holenumber]}%").paginate(:page=>params[:page],:per_page=>10)
    elsif params[:contractname]
      @holes = Hole.where("contract.name like ?", "%#{params[:contractname]}%").paginate(:page=>params[:page],:per_page=>10)
    elsif (params[:contractname] && params[:holenumber])
      @holes = Hole.where("holenumber=? and contract.name like ?", "%#{params[:holenumber]}%","#{params[:contractname]}%").paginate(:page=>params[:page],:per_page=>10)
    else
      @holes = Hole.paginate(:page=>params[:page],:per_page=>10)
    end

    respond_to do |format|
      format.html
      format.json
    end

  end
end
