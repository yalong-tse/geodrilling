#encoding: utf-8
module TourreportsHelper
  def hole_coreratio_xml(hole)
    #per = number_to_percentage(Tourreport.sumcore(hole.id).to_i/(hole.actualdeep.nil?? 1:hole.actualdeep) ,precision:0);
    #per = Tourreport.sumcore(hole.id).to_i/(hole.actualdeep.nil?? 1:hole.actualdeep) ;
    chartxml= "<graph caption='岩心采取率统计' xAxisName='岩心采取率' yAxisName='百分比' showNames='1' decimalPrecision='0' formatNumberScale='0' BaseFontSize = '12'>";
    chartxml << "<set name='岩心采取长度'" + "value='" + Tourreport.sumcore(hole.id).to_s + "' />";
    chartxml << "<set name='钻孔长度'" + "value='" + (hole.actualdeep.nil?? hole.designdeep.to_s : hole.actualdeep.to_s)  + "' />";
    chartxml << "</graph>";

    code =<<-END_OF_CODE
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="300" height="150" id="Column3D" >
			   <param name="movie" value="/FusionCharts/Pie2D.swf?chartWidth=300&chartHeight=150" />
			   <param name="FlashVars" value="&dataXML=#{chartxml}">
			   <param name="quality" value="high" />
			   <embed src="/FusionCharts/Pie2D.swf?chartWidth=300&chartHeight=120" flashVars="&dataXML=#{chartxml}" quality="high" width="300" height="120" name="Column3D" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
    END_OF_CODE
    code.html_safe;
  end
end
