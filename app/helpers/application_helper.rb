module ApplicationHelper
  def setActiveTab(whichtag)
    code = "$().ready(function(){"
    code << "$('##{whichtag}').attr('class','active')"
    code << "})"
    javascript_tag(code);
  end
end
