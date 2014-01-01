#encoding: utf-8
module LeaderHelper
  # 展示钻孔工作量的方式
  def contract_allholes_xml(contractid)
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
end
