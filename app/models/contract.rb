class Contract < ActiveRecord::Base
  attr_accessible :content, :finishdate, :name, :signdate, :startdate, :status
  has_many :holes
end
