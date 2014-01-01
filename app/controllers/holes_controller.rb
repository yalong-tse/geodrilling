#encoding: utf-8
class HolesController < ApplicationController

  # GET /holes
  # GET /holes.json
  def index
    #@holes = Hole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: HolesDatatable.new(view_context) }
    end
  end


  # 需要的另外一个list, for 班报填写的钻孔列表界面
  def list
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: HolelistDatatable.new(view_context) }
    end
  end

  # 用来班报查询的钻孔列表界面
  def tourreports
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: HolelisttourreportDatatable.new(view_context) }
    end
  end

  # 根据合同编号获取所有的钻孔列表的
  # android 手机端使用的方法
  def mobile
    @holes = Hole.getbycontractid(params[:contractid])
    @objs = Array.new
    @holes.each do |h|
      @objs <<
      {
        :id=> h.id,
        :minearea =>h.minearea,
        :holenumber=>h.holenumber
      }
    end
    respond_to do |format|
      format.html
      format.json {render :json=> @objs}
    end
  end

  # for 班报修改的钻孔列表页面
  def tourreportsmodify
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: HolelistmodifyDatatable.new(view_context) }
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
    @contracts = Contract.find(:all,:conditions=>"status=0 or status=1")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hole }
    end
  end

  # GET /holes/1/edit
  def edit
    @hole = Hole.find(params[:id])
    @contracts = Contract.find(:all,:conditions=>"status=0 or status=1")
  end

  # POST /holes
  # POST /holes.json
  def create
    @hole = Hole.new(params[:hole])
    # 更改合同的状态, 如果合同为"待执行"，则修改为“执行中”
    contract = Contract.find(params[:hole][:contract_id])
    if (contract.status == 0)
      contract.status = 1
      contract.save
    end
    #默认钻孔的状态是 0， 为待执行
    @hole.status = 0
    @hole.save_file(params[:attachment]) if params[:attachment]
    #logger.info "the attachment is #{params[:attachment]}"
    #logger.info "the hole info is #{@hole}"
    #logger.info "the contract id is #{params[:hole][:contract_id]}"
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

  def download
    @attachment = Attachment.find(params[:id]) if params[:id]
    filename ="#{@attachment.savepath}/#{@attachment.savefilename}"
    send_file filename if filename
  end

  # PUT /holes/1
  # PUT /holes/1.json
  def update
    @hole = Hole.find(params[:id])
    if(params[:opennoticeatt] || params[:closenoticeatt])
      @hole.save_closefile(params[:opennoticeatt],params[:closenoticeatt],params[:curvetableatt],params[:measuretableatt],params[:coretransferdoc],params[:tourreporttransferdoc],params[:qualitychecktable],params[:tourreporttabledoc])
      @hole.save
      # 释放占用的设备和人员
      Deployment.find_by_hole_id(@hole.id).destroy if (Deployment.find_by_hole_id(@hole.id))
      # 如果合同的钻孔都已经关闭，则需要关闭合同
      closeholenumber = Hole.where("status=2 and contract_id=?",@hole.contract_id).count
      holenumber = Hole.where("contract_id=?",@hole.contract_id).count
      if(closeholenumber == holenumber)
        @hole.contract.close
      end
    end

    respond_to do |format|
      if @hole.update_attributes(params[:hole]) 
        format.html { redirect_to @hole, notice: '钻孔状态成功更新.' }
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

  # 关孔的操作
  def close
    @hole = Hole.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hole }
    end
  end
  
end
