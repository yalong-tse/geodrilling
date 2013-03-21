module ContractsHelper
  def make_datepicker(args)
    code = "$(function (){"
    code << "$('##{args[:model]}_#{args[:property]}').datepicker({dateFormat:'yy-mm-dd'});"
    code << "});"
    javascript_tag(code);
  end
end
