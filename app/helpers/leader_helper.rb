#encoding: utf-8
module LeaderHelper
  # 展示合同所有的钻孔工作量的方式
  def display_contract_allholes_chart(contractid)
    @holes = Hole.getbycontractid(contractid)
    chartxml= "<graph decimalPrecision='0' numberSuffix='m' formatNumberScale='0' BaseFontSize='12'>";
    @holes.each do |hole|
      chartxml << "<set name='#{hole.holenumber}' value='#{hole.actualdeep}' color='AFD8F8' tooltext='矿区为:#{hole.minearea}' />";
    end
    chartxml << "</graph>";
    code =<<-END_OF_CODE
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="300" height="120" id="Bar2D" >
			   <param name="movie" value="/FusionCharts/Bar2D.swf?chartWidth=300&chartHeight=100" />
			   <param name="FlashVars" value="&dataXML=#{chartxml}" />
			   <param name="quality" value="high" />
			   <embed src="/FusionCharts/Bar2D.swf?chartWidth=300&chartHeight=100" flashVars="&dataXML=#{chartxml}" quality="high" width="300" height="100" name="Bar2D" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
    END_OF_CODE
    code.html_safe;
  end

  # 展示钻孔设计深度和实际深度的方式
  def display_holes_chart(designdeep,actualdeep)
    actualdeep = actualdeep.nil?? 0 : actualdeep
    chartxml= "<Chart bgColor='FFFFFF' bgAlpha='0' showBorder='0' upperLimit='#{designdeep}' lowerLimit='0' gaugeRoundRadius='5' chartBottomMargin='10' ticksBelowGauge='0' showGaugeLabels='0' valueAbovePointer='0' pointerOnTop='1' pointerRadius='9'>"
    chartxml << "<colorRange>"
    chartxml << "<color minValue='0' maxValue='100' name='GOOD'/>";
    chartxml << "</colorRange>"
    chartxml << "<value>#{actualdeep}</value>"
    chartxml << "<styles>"
    chartxml << "<definition>"
    chartxml << "<style name='ValueFont' type='Font' bgColor='333333' size='10' color='FFFFFF'/>"
    chartxml << "</definition>"
    chartxml << "<application>"
    chartxml << "<apply toObject='VALUE' styles='valueFont'/>"
    chartxml << "</application>"
    chartxml << "</styles>"
    chartxml << "</Chart>"

    code =<<-END_OF_CODE
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="200" height="70" id="HLinearGauge" >
			   <param name="movie" value="/FusionWidgets/HLinearGauge.swf?chartWidth=200&chartHeight=50" />
			   <param name="FlashVars" value="&dataXML=#{chartxml}" />
			   <param name="quality" value="high" />
			   <embed src="/FusionWidgets/HLinearGauge.swf?chartWidth=200&chartHeight=50" flashVars="&dataXML=#{chartxml}" quality="high" width="200" height="70" name="HLinearGauge" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
    END_OF_CODE
    code.html_safe;
  end

  # 计算年度的合同总额
  def amountcontract(year)
      amount = Contract.sum(:contractamount,:conditions=>["signdate<? and signdate>?",Time.mktime(year+1),Time.mktime(year)])
      return amount
  end 

  # 年度合同的个数
  def contractyearcount(year)
      yearcount = Contract.where("signdate<? and signdate>?",Time.mktime(year+1),Time.mktime(year)).count;
      return yearcount
  end

  def holeyearcount(year)
      yearcount = Hole.where("startdate<? and finishdate>?",Time.mktime(year+1),Time.mktime(year)).count;
      return yearcount;
  end

  def amountholeshift(year)
      amount = Tourreport.sum(:tourshift,:conditions=>["tourdate<? and tourdate>?",Time.mktime(year+1),Time.mktime(year)])
      return amount
  end 

end
