#encoding: utf-8
module ApplicationHelper
  #进行 tab 切换的方法
  def setActiveTab(whichtag)
    code = "$().ready(function(){"
    code << "$('##{whichtag}').attr('class','active')"
    code << "})"
    javascript_tag(code);
  end
  #返回上一个页面
  def link_back(args)
    link_to "返回",request.env["HTTP_REFERER"].blank?? "/":request.env["HTTP_REFERER"], :class=>args[:class]||="btn btn-info"
  end
  # 处理合同状态显示 helper
  def contract_status_treat(args)
    code = ""
    case args
    when 0
    code << "<span class='label label-inverse'>待执行</span>";
    when 1
    code << "<span class='label label-warning'>正在执行</span>";
    when 2
    code << "<span class='label label-success'>已经完成</span>";
    when 3
    code <<  "<span class='label label-info'>已经归档</span>";
    end
    code.html_safe
  end

  def formattime(args)
    if(args)
      DateTime.parse(args).strftime('%H:%M').to_s
    end
  end

  def tourreport_status_display(args)
    code = ""
    case args
    when '1'
        code << "正执行"
    when '2'
        code << "已关闭"
    end
    code.html_safe
  end

  def pump_group(rig)
    html = ""
    if (rig.pump && rig.pump.pumpmodel)
      html << "<span class='label label-success'>" 
      html << rig.pump.pumpmodel
      html << "</span>"
    else
      html << "<button class='btn btn-small btn-warning' onclick='javascript:open_pump()'>"
      html << "配组泥浆泵"
      html << "</button>"
    end
    html.html_safe
  end

  def drilltower_group(rig)
    html = ""
    if (rig.drilltower && rig.drilltower.model)
      html << "<span class='label label-success'>" 
      html << rig.drilltower.model
      html << "</span>"
    else
      html << "<button class='btn btn-small btn-warning' onclick='javascript:open_drilltower()'>"
      html << "配组钻塔"
      html << "</button>"
    end
    html.html_safe
  end

  def hole_use_device(hole)
    html = ""
    if(hole)
      html << "<button class='btn btn-small btn-warning' onclick='javascript:open_modal();'>"
      html << "配置设备"
      html << "</button>"
    end
    html.html_safe
  end

  def hole_use_materials(hole)
    html = ""
    if(hole)
      html << "<button class='btn btn-small btn-warning'>"
      html << "配置材料"
      html << "</button>"
    end
    html.html_safe
  end
end
