class RolesController < ApplicationController

  # only user with Admin role can access
  # before_filter :is_super_admin?
  
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
    # @permissoins = Permission.all
    @permissions_array = Permission.format_permissions_output(nil)
  end

  def create
    @role = Role.new(params[:role])
    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_url, notice: t('activerecord.successful.messages.created', :model => Role.model_name.human) }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @role = Role.find(params[:id])
    @permissions = @role.permissions
    @rowspan = Permission.count_rowspans_for_view(@permissions)
    @permissions = Permission.format_permissions_output(@permissions)
  end

  def edit
    @role = Role.find(params[:id])
    # @permissions = Permission.all
    @permissions_array = Permission.format_permissions_output(nil)
    @role_permissions = @role.permissions.collect{ |p| p.id }
  end

  def update
    # assign the permissions to the role if it isn't already assigned.
    @role = Role.find(params[:id])
    # @role.permissions = []
    # @role.set_permissions(params[role][permission_ids]) if params[role][permission_ids]
    if @role.update_attributes(params[:role])
      redirect_to roles_path and return
    else
      render 'edit'
    end
  end

  def destroy
    logger.debug "------------------------"
    @role = Role.find(params[:id])
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url }
    end
  end

  def destroy_multiple
    Role.destroy(params[:roles])
    respond_to do |format|
      format.html { redirect_to roles_url }
    end
  end

  private
  def is_super_admin?
  end
  
end

