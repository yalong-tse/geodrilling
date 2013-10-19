# encoding:utf-8
class DepartmentsController < ApplicationController
  layout 'iframe', :only => [:index, :show, :edit]
  
#  load_and_authorize_resource
 # before_filter :load_permissions # call this after load and authorize else it gives a cancan error

  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Department.json_tree(@departments) }
    end
  end

  # GET /departments/main
  def main
    @department = Department.roots.first
    @departments = Department.arrange
    # 新增同级部门或者新增子部门
    @department_new = Department.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department = Department.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department }
    end
  end

  # GET /departments/new
  # GET /departments/new.json
  def new
    @department = Department.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @department = Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.json/
  def create
    logger.debug "-------------------parent_id=#{params[:department][:parent_id]}"
    @department = Department.new(params[:department])

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: t('activerecord.successful.messages.created', :model => @department.class.model_name.human) }
        format.json { render json: @department, status: :created, location: @department }
        format.js {}
      else
        format.html { render action: "new" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.json
  def update
    @department = Department.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to @department, notice: t('activerecord.successful.messages.created', :model => @department.class.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    logger.debug "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&destroy=#{params[:id]}"
    @department = Department.find(params[:id])
    @department.destroy

    respond_to do |format|
      format.html { redirect_to departments_url }
      format.json { head :no_content }
      format.js {}
    end
  end

  # dynamic autoloading tree node
  def dynamic_tree
    logger.debug "dynamic_tree ************************#{params[:id]}"
    @department_tree = Department.dynamic_dhtmlxtree(params[:id])
    respond_to do |format|
      format.json {render json: @department_tree}
    end
  end
end
