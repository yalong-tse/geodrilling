#encoding: utf-8
class ContractsController < ApplicationController

  # GET /contracts
  # GET /contracts.json
  def index
#    @contracts = Contract.paginate(:page=>params[:page],:per_page=>25).all
#    logger.info("1111111111111111111111111111111111111")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: ContractsDatatable.new(view_context) }
    end
  end

  # for 关闭合同的列表，只选出执行完毕的合同
  def indexforclose
 #   @contracts = Contract.paginate(:page=>params[:page],:per_page=>5).where(:status=>2)
    respond_to do |format|
      format.html # indexforclose.html.erb
      format.json { render json: ContractscloseDatatable.new(view_context)}
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract = Contract.find(params[:id])
    @holes = Hole.where("contract_id =?",@contract.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contract }
    end
  end

  # GET /contracts/new
  # GET /contracts/new.json
  def new
    @contract = Contract.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contract }
    end
  end

  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(params[:contract])
    @contract.save_file(params[:attachment]) if params[:attachment]
    @contract.status=0
    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: '新增合同成功.' }
        format.json { render json: @contract, status: :created, location: @contract }
      else
        format.html { render action: "new" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.json
  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        format.html { redirect_to @contract, notice: '合同修改成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # 下载附件的方法
  def download
    @attachment = Attachment.find(params[:id]) if params[:id]
#    logger.info("the id is : #{params[:id]}")
    filename ="#{@attachment.savepath}/#{@attachment.savefilename}"
#    logger.info("the filename is #{filename}")
    send_file filename if filename
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to contracts_url }
      format.json { head :no_content }
    end
  end

  # 归档合同的方法,for ajax method
  def archive
#    @contract = Contract.find_by_contractno(params[:contractno])
    logger.info("the contractno is #{params[:contractno]}")
    @contract = Contract.find_by_contractno(params[:contractno])
    @contract.archive if @contract
    #Contract.close(params[:contractno])
    render :text=>"true"
  end
  
  # for fusionchart 
  def chart
    dai_number = Contract.where("status=0").count
    zhi_number = Contract.where("status=1").count
    finish_number = Contract.where("status=2").count
    gui_number = Contract.where("status=3").count
    @chartxml= "<graph caption='合同状态统计' xAxisName='合同' yAxisName='数量' showNames='1' decimalPrecision='0' formatNumberScale='0' BaseFontSize = '12'>";
    @chartxml << "<set name='待执行'" + "value='" + dai_number.to_s + "' />";
    @chartxml << "<set name='正在执行'" + "value='" + zhi_number.to_s + "' />";
    @chartxml << "<set name='已完成'" + "value='" + finish_number.to_s + "' />";
    @chartxml << "<set name='已归档'" + "value='" + gui_number.to_s + "' />";
    @chartxml << "</graph>";
    @chartxml = @chartxml.html_safe

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chartxml}
      format.xml { render xml: @chartxml}
    end

  end
end
