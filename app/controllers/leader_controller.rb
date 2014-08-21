#encoding: utf-8
class LeaderController < ApplicationController

  # 钻孔生产情况的界面，所有在生产的钻孔
  # 所有未完孔的钻孔情况
  def holeproduct
	conditions=[];
#	[:holenumber, :minearea, :outerflag, :contract.name,  :department.id].each{
#        |attr| conditions << Hole.send(:sanitize_sql, ["#{attr} LIKE ?", "%#{params[attr]}%"]) unless params[attr].blank? 
#	}
#	conditions = conditions.any? ? conditions.collect { |c| "(#{c})" }.join(' AND '):nil

	conditions << Hole.send(:sanitize_sql,["holenumber like ?", "%#{params[:holenumber]}%"]) if (!params[:holenumber].nil? && !params[:holenumber].empty?)
	conditions << Hole.send(:sanitize_sql,["minearea like ?" , "%#{params[:minearea]}%" ]) if(!params[:minearea].nil? && !params[:minearea].empty?)
	conditions << Hole.send(:sanitize_sql,["outerflag=?" , "#{params[:outerflag]}"])  if(!params[:outerflag].nil? && params[:outerflag]!="2")

	#conditions << Contract.send(:sanitize_sql,["name=? ", "%#{params[:contractname]}%"]) if(!params[:contractname].nil? && !params[:contractname].empty?)
	#conditions << Contract.send(:sanitize_sql,["contract.department_id=? ", "#{params[:departmentid]}" ]) if(!params[:departmentid].nil? && !params[:departmentid].empty?)

	conditions = conditions.any? ? conditions.collect { |c| "(#{c})" }.join(' AND '):nil

	
	if(!params[:contractname].nil? && !params[:contractname].empty?)
		@holes = Hole.where(conditions).joins(:contract).where("contracts.name like ?", "%#{params[:contractname]}%").paginate(:page=>params[:page],:per_page=>10)
	elsif(!params[:departmentid].nil? && !params[:departmentid].empty?)
		@holes = Hole.where(conditions).joins(:contract).where("contracts.department_id=?" , params[:departmentid]).paginate(:page=>params[:page],:per_page=>10)
	else
		@holes = Hole.where(conditions).paginate(:page=>params[:page],:per_page=>10)
	end

    #@holes = Hole.unclosed.paginate(:page=>params[:page])
    respond_to do |format|
      format.html
      format.json {render :json=>@holes}
    end
  end

  # 展示钻孔的所有班报的情况
  def holetourreport
  	@tourreports = Tourreport.findtourreports(params[:holeid])
	@hole = Hole.find(params[:holeid])
	
	@objs = "[" 

    tourreportxml= "<graph caption='钻孔进度分析' xAxisName='日期' yAxisName='深度' showNames='0' decimalPrecision='0' formatNumberScale='0' BaseFontSize = '12'>"

	@tourreports.each do |t|
      	tourreportxml << "<set name='#{t.tourdate.strftime("%Y-%m-%d")}' " + "value='" + t.currentdeep.to_s + "' />";
		@objs << "[#{Time.parse(t.tourdate.strftime('%Y-%m-%d')).to_i}000,#{t.currentdeep}],"
	end

	@objs = @objs.chop
	@objs << "]"
	@objs = @objs.html_safe
	tourreportxml << "</graph>";
	@tourreportxml = tourreportxml.html_safe

    respond_to do |format|
      format.html
      format.json {render :json=>@tourreports}
	end
  end


  # 此方法废弃不用
  def holetours
  begin
		@tourreports = Tourreport.findtourreports(params[:holeid])
		@objs = "holetour(/* AAPL historical OHLC data from the Google Finance API */" 
		@objs << "["
		if @tourreports
			@tourreports.each do |t|
				@objs << "['#{t.tourdate}',#{t.currentdeep}],"
			end
		end
		@objs = @objs.chop
		@objs << "])"
        respond_to do |format|
          format.html
          format.json {render :json=> @objs.to_s}
        end
	rescue
      respond_to do |format|
        format.html
        format.json {render :json=> "holeid invalid"}
      end
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
		if hole.unit_price.nil? || hole.unit_price.empty? || hole.actualdeep.nil?
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
