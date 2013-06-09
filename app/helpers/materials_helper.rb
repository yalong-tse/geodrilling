module MaterialsHelper
  def make_datepicker(args)
    code = "$(function (){"
    code << "$('#{args}').datepicker({dateFormat:'yy-mm-dd'});"
    code << "});"
    javascript_tag(code);
  end
end
