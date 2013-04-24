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
end
