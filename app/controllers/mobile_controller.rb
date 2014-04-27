#encoding: utf-8
class MobileController < ApplicationController

  skip_before_filter :login_required?, :only => [:contracts, :contractholes,:getdeployments,:savetourreport,:holedetail, :validateuser,:queryownholes, :queryuserinfo]

  include HolesUtils

  # 根据合同编号获取所有的钻孔列表的
  # android 手机端使用的方法
  def contractholes 
    begin
      @holes = Hole.getbycontractid(params[:contractid])
      @objs = Array.new
      if @holes
        @holes.each do |h|
          @objs <<
          {
            :id=> h.id,
            :minearea =>h.minearea,
            :holenumber=>h.holenumber
          }
        end
        respond_to do |format|
          format.html
          format.json {render :json=> @objs}
        end
      end
    rescue
      respond_to do |format|
        format.html
        format.json {render :json=> "contractid invalid"}
      end
    end
  end

  # for 手机端的json数据
  # url 必须以json 结尾
  def contracts 
    begin
      @contracts = Contract.unclosed
      @objs = Array.new
      @contracts.each do |contract|
        @objs << {
          :id=>contract.id,
          :contractno => contract.contractno,
          :name =>contract.name
        }
      end
      respond_to do |format|
        format.xml
        format.json {render :json=>@objs }
      end
    rescue
      respond_to do |format|
        format.xml
        format.json {render :json=>"invalid" }
      end
    end
  end

  # 得到某个钻孔的，设备配置情况和人员配置情况
  def getdeployments
    #@hole = Hole.find(params[:holeid])
    @objs = Array.new
    @deployment = Deployment.find_by_hole_id(params[:holeid])
    if @deployment
      if @deployment.user
        #得到机长信息
        @objs<< {
          :id => @deployment.user.id,
          :name => @deployment.user.name,
          :type => "holeleader"
        }

        # 得到项目经理信息
        if @deployment.user.leader
          @objs << {
            :id => @deployment.user.leader.id,
            :name => @deployment.user.leader.name,
            :type => "projectmanager"
          } 

        end

        # 得到三个班长的列表
        if @deployment.user.members
          @deployment.user.members.each do |m|
            @objs<< {
              :id => m.id,
              :name => m.name,
              :type => "tourleader"
            }
          end
        end

        # 得到钻孔的配置的钻机
        if @deployment.rigmachine
          @objs<<{
            :id => @deployment.rigmachine.id,
            :name => @deployment.rigmachine.devicenumber,
            :type =>"rigmachine" 
          }
        end

        if @deployment.pump
          @objs<<{
            :id => @deployment.pump.id,
            :name => @deployment.pump.devicenumber,
            :type =>"pump" 
          }
        end

        if @deployment.drilltower
          @objs<<{
            :id => @deployment.drilltower.id,
            :name => @deployment.drilltower.devicenumber,
            :type =>"drilltower" 
          }
        end

      end
    end

    respond_to do |format|
      format.xml
      format.json {render :json=>@objs }
    end

  end

  # 得到钻孔的详细信息,钻孔的其他信息, 比如当前的孔深，矿区，孔号
  def holedetail
    begin
      hole = Hole.find(params[:holeid])
      obj = {
          :minearea=>hole.minearea,
          :actualdeep=>hole.actualdeep,
          :holenumber=>hole.holenumber,
          :geologysituation=>hole.geologysituation
          }
      respond_to do |format|
        format.xml
        format.json {render :json=>obj}
      end
    rescue
      respond_to do |format|
        format.xml
        format.json {render :json=>"holeid invalid"}
      end
    end
  end

  # 接收Json 提交的班报内容
  # 提交的JSON 格式字符串
  def savetourreport
    logger.info "----------------------------------------------"
    #logger.info params[:email]
    #logger.info params[:password]

    @tourreport = Tourreport.new
    @tourreport.administrator = params[:administrator]
    @tourreport.holeid = params[:holeid]
    @tourreport.projectmanager = params[:projectmanager]
    @tourreport.tourleader = params[:tourleader]
    @tourreport.recorder = params[:recorder]
    @tourreport.tourdate = params[:tourdate]
    @tourreport.starttime = params[:starttime]
    @tourreport.finishtime = params[:endtime]
    @tourreport.tourshift = params[:tourshift]
    @tourreport.tourcore = params[:tourcore]
    @tourreport.source = 2
    @tourreport.lastdeep = params[:lastdeep]
    @tourreport.currentdeep = params[:currentdeep]
    @tourreport.tourdrillingtime = params[:tourdrillingtime]
    @tourreport.tourauxiliarytime = params[:tourauxiliarytime]
    @tourreport.holeaccidenttime = params[:holeaccidenttime]
    @tourreport.deviceaccidenttime = params[:deviceaccidenttime]
    @tourreport.othertime = params[:othertime]
    @tourreport.totaltime = params[:totaltime]
    @tourreport.takeoverremark = params[:takeoverremark]
    @tourreport.intrumenttakeover = params[:instrumenttakeover]
    @tourreport.centralizer = params[:centralizer]
    @tourreport.antideviation = params[:antideviation]
    params[:workcontent].each_index do |i|
      workcontent = Workcontent.new
      workcontent.starttime = params[:workcontent][i][:starttime]
      workcontent.finishtime = params[:workcontent][i][:endtime]
      workcontent.content = params[:workcontent][i][:content]
      workcontent.upmore= params[:workcontent][i][:upmore]
      workcontent.corename= params[:workcontent][i][:corename]
      workcontent.coregrade= params[:workcontent][i][:coregrade]
      workcontent.corenumber= params[:workcontent][i][:corenumber]
      workcontent.corelength= params[:workcontent][i][:corelength]
      workcontent.coreleftlength= params[:workcontent][i][:coreleftlength]
      workcontent.drilllength= params[:workcontent][i][:drillinglength]
      workcontent.drillbit= params[:workcontent][i][:drillbit]
      workcontent.rotatespeed = params[:workcontent][i][:rotatespeed]
      workcontent.pumpquantity = params[:workcontent][i][:pumpquantity]
      workcontent.pumppressure = params[:workcontent][i][:pumppressure]
      workcontent.holedeep = params[:workcontent][i][:holedeep]
      workcontent.tourreport= @tourreport
      workcontent.save
    end

    respond_to do |format|
      if @tourreport.save
        format.html 
        format.json { render :json=>{ :result => "success" } }
      else
        format.html 
        format.json { render :json => { :result => "failure" }  }
      end
    end
  end

  # 获取最新的5条班报
  def gettourreports
    logger.info("the holeid is :#{params[:holeid]}");
    hole = Hole.find(params[:holeid])

  end

  # 验证用户登录
  def validateuser
    result =""
    if params[:account].blank?
      result = "false"
    end

    if params[:password].blank?
      result = "false"
    end

    user = User.authenticate(params[:account], params[:password])
    if user
      result = user.id.to_s 
    else
      result = "false"
    end

    respond_to do |format|
      format.html
      format.json {render :json=> result}
    end
  end


  # 获取自己管辖的钻孔
  def queryownholes
    if params[:userid]
      begin
	    logger.info("111111111111111");
        holes = findholes(params[:userid])
	    logger.info("222222222222222222222222");
        @objs = Array.new
        holes.each do |h|
          @objs << {
            :id=> h.id,
            :minearea =>h.minearea,
            :contractname => h.contract.name,
            :outerflag => h.outerflag,
            :holenumber=>h.holenumber
          }
        end
        respond_to do |format|
          format.html
          format.json {render :json=> @objs}
        end
      rescue
        respond_to do |format|
          format.html
          format.json {render :json=> @objs}
        end
      end
    end
  end

  # 查询该用户的详细信息
  def queryuserinfo
    if params[:userid]
      begin
        user = User.find(params[:userid])
        obj = {
          :name=> user.name, 
          :duty => user.duty,
          :mobile => user.mobile,
          :sex => user.sex,
          :account => user.account,
          :position => user.position,
          :departmentname => user.department.name
        }
        respond_to do |format|
          format.html
          format.json {render :json=> obj}
        end
      rescue
        respond_to do |format|
          format.html
          format.json {render :json=> "userid invalid"}
        end
      end
    end
  end

end
