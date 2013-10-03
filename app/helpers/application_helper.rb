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
    when 0
      code << "<span class='label label-inverse arrowed-in'>待执行</span>"
    when 1
      code << "<span class='label label-success arrowed-in'>正在执行</span>"
    when 2
      code << "<span class='label label-info arrowed-in'>终孔</span>"
    when 3 
      code << "<span class='label label-inverse arrowed-in'>停工</span>"
    when 4
      code << "<span class='label label-success arrowed-in'>续作</span>"
    when nil
      code << "<span class='label label-success arrowed-in'>正在执行</span>"
    end
    code.html_safe
  end

  def holenumber_dealing(holeid)
    result = ""
    logger.info("==============="+holeid)
    if holeid then 
      hole = Hole.find(holeid) if holeid
      result = hole.contract.name + "[" + hole.holenumber + "]" if hole
    end
    return result
  end

  def hole_enable_archive(status)
    code = ""
    if status == 2 
      code << "<button class='btn btn-small btn-warning' onclick='open_modal(this)'>归档</button>"
    else
      code << "<button class='btn btn-small btn-warning' onclick='open_modal(this)'>无</button>"
    end
    code.html_safe
  end
  # 处理合同状态显示 helper
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
  def hole_deployment(hole)
    html = ""
    if(hole)
      html << "<button class='btn btn-mini btn-warning' onclick='javascript:open_hole_deployment(#{hole.id})'>"
      html << "钻孔配置"
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

  def bootstrap_class_for(flash_type)
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
  
  def makechoice
    code =<<-END_OF_CODE
    <select name="choice" >
      <option value="like">模糊</option>
      <option value="=">精确</option>
      <option value=">">大于</option>
      <option value="<">小于</option>
    </select>
    END_OF_CODE
    code.html_safe
  end
  
  def makeminus
    code =<<-END_OF_CODE
    <i class="icon-minus-sign"></i>
    END_OF_CODE
    code.html_safe
  end

  def makeplus
    code =<<-END_OF_CODE
    <i class="icon-plus-sign"></i>
    END_OF_CODE
    code.html_safe
  end

  def active_page? (path)
    if path ==nil
      ''
    elsif current_page?(path)
      raw ("class='active'")
    else
      ''
    end
  end

  def active_menu? (path)
    path ? 'active open' : ''
  end
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  def contract_status(passkey)
    h3 = Hash[Contract::STATUS.map {|key,value| [value,key] }]
#    puts h3
    return h3[passkey]
  end

  def contract_fundsource(passkey)
    dic = Dictionary.find(passkey)
    if dic
      return dic.item 
    else
      return ""
    end
  end

  # 根据holeid 获取 钻孔的机长
  def hole_administrator(holeid)
    result =""
    d = Deployment.find_by_hole_id holeid
    if d
      if d.user
        result << d.user.name
        if (d.user.members)
          result << "["
          d.user.members.each do |m|
            result << m.name + " "
          end
          result << "]"
        end
      end
    else
      return result 
    end
  end

  # 根据holeid 获取配置的钻机
  def hole_rigmachine(holeid)
    d = Deployment.find_by_hole_id(holeid)
    if d
      return d.rigmachine.devicenumber + "-" + d.rigmachine.rigmodel if d.rigmachine
    else
      ""
    end
  end

  # 根据holeid 获取配置的钻塔
  def hole_drilltower(holeid)
    d = Deployment.find_by_hole_id(holeid)
    if d
      return d.drilltower.devicenumber+"-"+ d.drilltower.model if d.drilltower
    else
      ""
    end
  end
  
  # 根据holeid 获取配置的泥浆泵
  def hole_pump(holeid)
    d = Deployment.find_by_hole_id(holeid)
    if d
      return d.pump.devicenumber+"-" + d.pump.pumpmodel if d.pump
    else
      ""
    end
  end

  #处理合同的附件
  def contract_attachment_dealing(args)
    if(args && args.attachment)
#      link_to "返回",request.env["HTTP_REFERER"].blank?? "/":request.env["HTTP_REFERER"], :class=>args[:class]||="btn btn-info"
      link_to args.attachment.filename,contracts_download_path+"?id=#{args.attachment.id}", :class=>args[:class]||="alert alert-success" 
    end
  end


  # 处理钻孔的附件
  def hole_attachment_dealing(args)
    if(args && args.attachment)
      link_to args.attachment.filename,holes_download_path+"?id=#{args.attachment.id}", :class=>args[:class]||="alert alert-success" 
    end
  end
 
 # 判断是否 早班、中班 和 晚班的方法 
  def morning_or_noon(hour)
    if(hour)
      if(hour == "00:00")
        return "早"
      elsif (hour=="08:00")
        return "中"
      else
        return "晚"
      end
    end
  end

  # 得到所有的机长，以及机长下属的所有班长
  def get_leader_member
    result = ""
    Group.get_all_leader.each do |leader|
      result<< "<option value='" + leader.id.to_s + "'>" +"机长:" + leader.name + " [班长：";
        leader.members.each do |user|
          result << user.name + " "
        end

      result <<  "]"  + "</option>"
    end
    return result.html_safe;
  end

  # 得到每个设备的状态 
  def get_device_status(obj)
    if obj 
      if(obj.is_a?(Rigmachine))
         deployment = Deployment.where(:rigmachine_id=>obj.id).first
      elsif (obj.is_a?(Drilltower))
         deployment = Deployment.where(:drilltower_id =>obj.id).first
      elsif (obj.is_a?(Pump))
        deployment = Deployment.where(:pump_id=>obj.id).first
      end
      if(deployment)
        hole = Hole.find(deployment.hole_id) 
        if hole
          return "钻孔编号：" + hole.holenumber
        else
          return "空闲"
        end
      else
        return "空闲"
      end
    end
  end



end
