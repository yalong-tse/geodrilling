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

  # 处理钻孔的状态
  # 1-执行中 2-终孔 3-停工  4-续作
  def hole_status_treat(args)
    code = ""
    case args
    when 1
      code << "<span class='label label-success'>正在执行</span>"
    when 2
      code << "<span class='label label-info'>终孔</span>"
    when 3 
      code << "<span class='label label-inverse'>停工</span>"
    when 4
      code << "<span class='label label-success'>续作</span>"
    when nil
      code << "<span class='label label-success'>正在执行</span>"
    end
    code.html_safe
  end

  def hole_enable_archive(status)
    code = ""
    if status == 2 
      code << "<button class='btn btn-small btn-warning'>归档</button>"
    else
      code << "<button class='btn btn-small btn-warning'>无</button>"
    end
    code.html_safe
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
      html << "<button class='btn btn-small btn-warning' onclick='javascript:open_modal_device();'>"
      html << "配置设备"
      html << "</button>"
    end
    html.html_safe
  end

  # 设备状态处理
  def device_status(args)
    result = ""
    case args
    when "0"
      result = "<span class='label label-success'>空闲</span>"
    when nil
      result = "<span class='label label-success'>空闲</span>"
    when "2"
      result = "<span class='label label-important'>占用</span>"
    end
    result.html_safe
  end

  #钻孔配置材料的处理
  def hole_use_materials(hole)
    html = ""
    if(hole)
      html << "<button class='btn btn-small btn-warning' onclick='javascript:open_modal_material()'>"
      html << "配置材料"
      html << "</button>"
    end
    html.html_safe
  end

  # 字典删除标识处理
  def dictionary_delflag(arg)
    result = ""
    case arg
    when "0"
      result ="<span class='label label-success'>可用</span>"
    when nil
      result = "<span class='label label-success'>可用</span>"
    when "1"
      result = "<span class='label label-warning'>不可用</span>"
    end
    result.html_safe
  end
end
