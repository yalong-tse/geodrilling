class Hole < ActiveRecord::Base
  attr_accessible :deep, :diameter, :finishdate, :startdate,:contract
  belongs_to :contract,:class_name=>"Contract" ,:foreign_key=>"contract_id"

end
