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
    
    #计算年度的总进尺
  	summarydeep = Hole.unclosed.sum(:actualdeep);
	lastyearleft = Lastyearleft.first;
	if lastyearleft.nil?
		@lastyearvalue = 0
		@lastyearprice = 0
	else
		@lastyearvalue= lastyearleft.lastyeartotallength
		@lastyearprice= lastyearleft.lastyearprice
		if @lastyearprice.nil? || @lastyearprice.empty?
			@lastyearprice = 0
		else
		    @lastyearprice = lastyearleft.lastyearprice.to_f
		end
	end
	@lastyearvalue = summarydeep - @lastyearvalue
	@lastyearvalue = format("%.2f", @lastyearvalue)

    # 计算钻孔的产值
	@allhole_output = 0
	Hole.unclosed.each do |hole|
		if hole.unit_price.nil? || hole.actualdeep.nil? || hole.actualdeep.empty?
		  @hole_output = 0 
		else	
		  @hole_output = hole.actualdeep * hole.unit_price.to_f
		end
		@allhole_output = @allhole_output + @hole_output
	end

	@allhole_output = @allhole_output - @lastyearprice
	@allhole_output = format("%.2f",@allhole_output)

    respond_to do |format|
      format.html
    end

  end


# 查询页面的方法
  def lastyearleft
  	@lastyearleft = Lastyearleft.first;
	if @lastyearleft.nil?
		@lastyearvalue= 0
		@lastyearprice =0
	else
		@lastyearvalue= @lastyearleft.lastyeartotallength
		@lastyearprice= @lastyearleft.lastyearprice
	end

    respond_to do |format|
      format.html
    end
  end

# 保存所有跨年度的所有孔的总孔深
  def savelastyear
	  begin
		totalleftlength = params[:totallengthleft]
		lastyearprice = params[:lastyearprice]
		@lastyearleft = Lastyearleft.first;
		if @lastyearleft.nil?
			@lastyearleft = Lastyearleft.new
		end

		@lastyearleft.lastyeartotallength = totalleftlength
		@lastyearleft.lastyearprice = lastyearprice 

		@lastyearleft.save
		render :text=>"true"
	rescue
		render :text=>"false"
	end
  end

end
