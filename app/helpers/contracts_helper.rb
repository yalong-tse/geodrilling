module ContractsHelper
  def make_datepicker(args)
    code = "$(function (){"
    code << "$('#{args}').datepicker({format:'yyyy-mm-dd'});"
    code << "});"
    javascript_tag(code);
  end

  # 合同的资金来源的处理
  def contract_fundsource(passkey)
    dic = Dictionary.find(passkey)
    if dic
      return dic.item 
    else
      return ""
    end
  end

end
