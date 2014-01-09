class Contractassets < ActiveRecord::Base
  attr_accessible :contract_id, :data_content_type, :data_file_name, :data_file_size, :data_updated_at

  belongs_to :contract, :class_name=>"Contract" , :foreign_key =>"contract_id"
end
