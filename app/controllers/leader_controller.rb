class LeaderController < ApplicationController

  # 钻孔生产情况的界面，所有在生产的钻孔
  # 所有未完孔的钻孔情况
  def holeproduct
    @holes = Hole.unclosed.paginate(:page=>params[:page])
    respond_to do |format|
      format.html
      format.json {render :json=>@holes}
    end

  end

  # 所有完孔的情况
  def holefinish
    @holes = Hole.closed.paginate(:page=>params[:page])
    respond_to do |format|
      format.html
      format.json {render :json=>@holes}
    end
  end

  # 合同情况
  def contract
    @contracts = Contract.paginate(:page=>params[:page])

    respond_to do |format|
      format.html
      format.json {render :json=>@contracts}
    end

  end
end
