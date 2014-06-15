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

  # 年度统计表
  def yearreport
    
    year = params[:year]
    if year.nil?
      year = Time.now.strftime("%Y").to_i
    else
      year = year.to_i
    end

    @year=year;
    
  	summarydeep = Hole.unclosed.sum(:actualdeep);
	lastyearleft = Lastyearleft.first;
	if lastyearleft.nil?
		@lastyearvalue = 0
	else
		@lastyearvalue= lastyearleft.lastyeartotallength
	end

	@lastyearvalue = summarydeep - @lastyearvalue
	@lastyearvalue = format("%.2f", @lastyearvalue)

    respond_to do |format|
      format.html
    end

  end


# 查询页面的方法
  def lastyearleft
  	@lastyearleft = Lastyearleft.first;
	if @lastyearleft.nil?
		@lastyearvalue= 0
	else
		@lastyearvalue= @lastyearleft.lastyeartotallength

	end
    respond_to do |format|
      format.html
    end
  end

# 保存所有跨年度的所有孔的总孔深
  def savelastyear
	  begin
		totalleftlength = params[:totallengthleft]
		@lastyearleft = Lastyearleft.first;
		if @lastyearleft.nil?
			@lastyearleft = Lastyearleft.new
		end

		@lastyearleft.lastyeartotallength = totalleftlength
		@lastyearleft.save
		render :text=>"true"
	rescue
		render :text=>"false"
	end
  end

end
