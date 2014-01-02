#encoding: utf-8
class MobileController < ApplicationController

  skip_before_filter :login_required?, :only => [:contracts, :contractholes,:getdeployments,:savetourreport]

  # 根据合同编号获取所有的钻孔列表的
  # android 手机端使用的方法
  def contractholes 
    @holes = Hole.getbycontractid(params[:contractid])
    @objs = Array.new
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

  # for 手机端的json数据
  # url 必须以json 结尾
  def contracts 
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
  end

  # 得到某个钻孔的人员配置情况
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
      end
    end

    respond_to do |format|
      format.xml
      format.json {render :json=>@objs }
    end

  end


  # 接收Json 提交的班报内容
  # 提交的JSON 格式字符串
  def savetourreport
    logger.info "----------------------------------------------"
    logger.info params[:email]
    logger.info params[:password]

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
      #workcontent.save
    end

    respond_to do |format|
      #if @tourreport.save
        format.html 
        format.json { render :json=>{ :result => "success" } }
      #else
      #  format.html 
      #  format.json { render :json => { :result => "failure" }  }
      #end
    end

  end

end
