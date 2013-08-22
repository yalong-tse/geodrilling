class Group < ActiveRecord::Base
  attr_accessible :name, :groupflag
  has_and_belongs_to_many :users
end
