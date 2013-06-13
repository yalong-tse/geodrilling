class RolesController < ApplicationController

  # only user with Admin role can access
  # before_filter :is_super_admin?
  
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
    # @permissoins = Permission.all
    @permissions_array = Permission.format_permissions_output
  end

  def show
    @role = Role.find(params[:id])
    @permissions = @role.permissions
  end

  def edit
    @role = Role.find(params[:id])
    # @permissions = Permission.all
    @permissions_array = Permission.format_permissions_output
    @role_permissions = @role.permissions.collect{ |p| p.id }
  end

  def update
    # assign the permissions to the role if it isn't already assigned.
    @role = Role.find(params[:id])
    @role.permissions = []
    @role.set_permissions(params[:permissions]) if params[:permissions]
    if @role.save
      redirect_to roles_path and return
    end
    @permissions = Permission.all
    render 'edit'
  end

  private
  def is_super_admin?
  end
  
end

