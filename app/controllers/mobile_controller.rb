#encoding: utf-8
class MobileController < ApplicationController

  skip_before_filter :login_required?, :only => [:contracts, :contractholes,:getdeployments]

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
        # 得到项目经理和 机长的信息
        if @deployment.user.leader
          @objs << {
            :projectmanager => @deployment.user.leader.name,
            :holeleader => @deployment.user.name
          } 
        end
        # 得到三个班长的列表
        if @deployment.user.members
          @deployment.user.members.each do |m|
            @objs<< {
              :tourleader => m.name + " "
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


end
