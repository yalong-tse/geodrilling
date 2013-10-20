# encoding: utf-8
class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments
  has_and_belongs_to_many :permissions

  attr_accessible :name, :description, :permission_ids

  def permission_ids=(permission_ids)
    self.permissions = []
    permission_ids.each do |p_id|
      permission = Permission.find(p_id)
      # unless self.is_exist? p_id 
      self.permissions << permission
      # end
    end
  end

  def is_exist? (permission_id)
    self.permissions.where(:id => permission_id).exists?
  end
end
