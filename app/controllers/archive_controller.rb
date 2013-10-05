#encoding: utf-8
class ArchiveController < ApplicationController

  # 列出所有已经归档的合同
  def contract
    respond_to do |format|
      format.html # indexforclose.html.erb
      format.json { render json: ContractsarchivedDatatable.new(view_context)}
    end
    #@contracts = Contract.wait_archive.paginate(:page=>params[:page],:per_page=>5)
  end

  # 合同归档的操作
  def contractarchive
  end
  #列出所有已经关闭的钻孔
  def hole
    @holes = Hole.closed.paginate(:page=>params[:page],:per_page=>5)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @holes }
    end
  end

  #钻孔归档的操作
  def holearchive
  end


  #列出所有已经归档的班报
  def tourreport
    @tourreports = Tourreport.archive.paginate(:page=>params[:page],:per_page=>5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tourreports }
    end
  end
end
