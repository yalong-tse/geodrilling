#encoding: utf-8
module TourreportsHelper
  # 岩心采取率，百分比表示
  def hole_coreratio_xml(hole)
    #per = number_to_percentage(Tourreport.sumcore(hole.id).to_i/(hole.actualdeep.nil?? 1:hole.actualdeep) ,precision:0);
    per = Tourreport.sumcore(hole.id).to_i/(hole.actualdeep.nil?? 1:hole.actualdeep) ;
    chartxml= "<graph decimalPrecision='0' numberSuffix='%25' formatNumberScale='0' BaseFontSize='12'>";
    chartxml << "<set name='岩心采取率' value='#{per}' color='AFD8F8' tooltext='岩心采取率为#{per}' />";
    #chartxml << "<set name='钻孔长度'" + "value='" + (hole.actualdeep.nil?? hole.designdeep.to_s : hole.actualdeep.to_s)  + "' />";
    chartxml << "</graph>";
    #chartxml = "<chart lowerLimit='0' upperLimit='100' lowerLimitDisplay='Bad' upperLimitDisplay='Good' palette='1' numberSuffix='%25' showValue='1'>";
    #chartxml << "<colorRange>"
    #chartxml << "<color minValue='0' maxValue='75' code='FF654F'/>"
    #chartxml << "<color minValue='75' maxValue='90' code='F6BD0F'/>"
    #chartxml << "<color minValue='90' maxValue='100' code='8BBA00'/>"
    #chartxml << "</colorRange>"
    #chartxml << "<dials>"
    #chartxml << "<dial value='#{per}' rearExtension='10'/>"
    #chartxml << "</dials>"
    #chartxml << "</chart>"

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
  
  # 机械转速的计算
  def mech_speed(hole)
    deep = hole.actualdeep.nil?? 1 : hole.actualdeep
    drillingtime = Tourreport.sum_drillingtime(hole.id)
    v = deep/drillingtime
    chartxml = "<chart lowerLimit='0' upperLimit='30' lowerLimitDisplay='Bad' upperLimitDisplay='Good' palette='1' numberSuffix='m/h' showValue='1'>";
    chartxml << "<colorRange>"
    chartxml << "<color minValue='0' maxValue='10' code='FF654F'/>"
    chartxml << "<color minValue='20' maxValue='90' code='F6BD0F'/>"
    chartxml << "<color minValue='30' maxValue='100' code='8BBA00'/>"
    chartxml << "</colorRange>"
    chartxml << "<dials>"
    chartxml << "<dial value='#{v}' rearExtension='10'/>"
    chartxml << "</dials>"
    chartxml << "</chart>"

    code =<<-END_OF_CODE
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="300" height="150" id="AngularGauge" >
			   <param name="movie" value="/FusionWidgets/AngularGauge.swf?chartWidth=300&chartHeight=150" />
			   <param name="FlashVars" value="&dataXML=#{chartxml}">
			   <param name="quality" value="high" />
			   <embed src="/FusionWidgets/AngularGauge.swf?chartWidth=300&chartHeight=120" flashVars="&dataXML=#{chartxml}" quality="high" width="300" height="120" name="AngularGauge" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
    END_OF_CODE
    code.html_safe;
  end
  
  #回次转速的计算
  def rec_speed(hole)
    deep = hole.actualdeep.nil?? 1 : hole.actualdeep
    drillingtime = Tourreport.sum_drillingtime(hole.id)
    auxtime = Tourreport.sum_auxtime(hole.id)
    v = deep/(drillingtime + auxtime)

    chartxml = "<chart lowerLimit='0' upperLimit='30' lowerLimitDisplay='Bad' upperLimitDisplay='Good' numberSuffix='m/h' palette='1' showValue='1'>";
    chartxml << "<colorRange>"
    chartxml << "<color minValue='0' maxValue='10' code='FF654F'/>"
    chartxml << "<color minValue='20' maxValue='90' code='F6BD0F'/>"
    chartxml << "<color minValue='30' maxValue='100' code='8BBA00'/>"
    chartxml << "</colorRange>"
    chartxml << "<dials>"
    chartxml << "<dial value='#{v}' rearExtension='10'/>"
    chartxml << "</dials>"
    chartxml << "</chart>"

    code =<<-END_OF_CODE
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="300" height="150" id="AngularGauge" >
			   <param name="movie" value="/FusionWidgets/AngularGauge.swf?chartWidth=300&chartHeight=150" />
			   <param name="FlashVars" value="&dataXML=#{chartxml}">
			   <param name="quality" value="high" />
			   <embed src="/FusionWidgets/AngularGauge.swf?chartWidth=300&chartHeight=120" flashVars="&dataXML=#{chartxml}" quality="high" width="300" height="120" name="AngularGauge" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
    END_OF_CODE
    code.html_safe;
  end
end
