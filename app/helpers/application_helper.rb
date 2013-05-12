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
    link_to "返回",request.env["HTTP_REFERER"].blank?? "/":request.env["HTTP_REFERER"], :class=>args[:class]||="btn"
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
    return simple_format(code)
  end

  def formattime(args)
    if(args)
      DateTime.parse(args).strftime('%H:%M').to_s
    end
  end
end
