#encoding: utf-8
module GlobalFun
  # 钻孔编号处理
  def holenumber_dealing(holeid)
    result = ""
    if holeid then 
      hole = Hole.find(holeid) if holeid
      if (hole.outerflag)
        result = hole.contract.name + "[" + hole.holenumber + "]" +"[外协]"  if hole
      else
        result = hole.contract.name + "[" + hole.holenumber + "]" if hole
      end
    end
    return result
  end


  # 钻孔状态显示的方法
  def hole_status_treat(args)
    code = ""
    case args
    when 0
    code << "<span class='label label-inverse arrowed-in'>待执行</span>";
    when 1 
    code << "<span class='label label-success arrowed-in'>执行中</span>";
    when 2 
    code << "<span class='label label-alert arrowed-in'>终孔</span>";
    when 3 
    code << "<span class='label label-inverse arrowed-in'>停工</span>";
    when 4 
    code <<  "<span class='label label-warning arrowed-in'>续作</span>";
    end
    code.html_safe
  end

  # 合同状态显示
  def contract_status_treat(args)
    code = ""
    case args
    when 0 
    code << "<span class='label label-inverse arrowed-in'>待执行</span>";
    when 1 
    code << "<span class='label label-warning arrowed-in'>正在执行</span>";
    when 2 
    code << "<span class='label label-success arrowed-in'>已经完成</span>";
    when 3 
    code <<  "<span class='label label-info arrowed-in'>已经归档</span>";
    end
    code.html_safe
  end

  # 规范时间显示的方法
  def regtime(args)
    if(args)
      args.strftime("%Y-%m-%d")
    else
      ""
    end
  end

end
