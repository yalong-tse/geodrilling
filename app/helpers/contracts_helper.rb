module ContractsHelper
  def make_datepicker(args)
    code = "$(function (){"
    code << "$('#{args}').datepicker({format:'yyyy-mm-dd'});"
    code << "});"
    javascript_tag(code);
  end
end
