# encoding: utf-8
class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments
  has_and_belongs_to_many :permissions

  attr_accessible :name, :description

  # 设置role的权限permissions
  def set_permissions(permissions)
    permissions.each do |id|
      # find the main permission assigned from the UI
      permission = Permission.find(id)
      self.permissions << permission
    end
  end
end
