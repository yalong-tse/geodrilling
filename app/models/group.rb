class Group < ActiveRecord::Base
  attr_accessible :name, :groupflag, :userids, :leaderid
  has_and_belongs_to_many :users

  def self.save_users(userids, groupflag)
    group = Group.find_by_groupflag(groupflag)
    userids.split(/,/).each do |userid|
      User.find(userid).update_attributes(:group_ids => group.id)
    end
  end

  def self.get_all_admin
    users = Group.find_by_groupflag(1).users
  end

  def self.get_all_leader
    users = Group.find_by_groupflag(2).users
  end

end
