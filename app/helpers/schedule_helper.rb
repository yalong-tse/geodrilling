#encoding: utf-8
module ScheduleHelper
  def make_calendar_for_contract
    @contract = Contract.find(:all);
    events_block = "events:["
    @contract.each do |contract| 
      datesplit = contract.startdate.to_s().split('-')
      events_block << " {title: '#{contract.name}',start:new Date(#{datesplit[0]},#{datesplit[1]}-1,#{datesplit[2]}) },"
    end
    events_block = events_block.chop
    events_block << "]"


    code =<<-END_OF_CODE
	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			editable: true,
            #{events_block}
		});
	});
    END_OF_CODE
    javascript_tag(code);
  end


  # 根据钻孔得到班报的表列表，在calendar 上进行显示
  # 只需查询当月的班报情况就可以了
  def make_calendar_for_tourreport(holeid)
    @tourreport = Tourreport.find(:all);
    events_block = "events:["
    @tourreport.each do |tour| 
      datesplit = tour.tourdate.to_s().split('-')
      events_block << " {title: '#{tour.hole.holenumber}, #{tour.administrator},进尺 #{tour.tourshift}',start:new Date(#{datesplit[0]},#{datesplit[1]}-1,#{datesplit[2]}) },"
    end
    events_block = events_block.chop
    events_block << "]"


    code =<<-END_OF_CODE
	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			editable: true,
            #{events_block}
		});
	});
    END_OF_CODE
    javascript_tag(code);
  end
end
