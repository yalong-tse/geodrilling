class Contractassets < ActiveRecord::Base
  attr_accessible :contract_id, :data_content_type, :data_file_name, :data_file_size, :data_updated_at , :data_origin_file_name, :data

  before_create :randomize_file_name
  before_update :randomize_file_name

  belongs_to :contract, :class_name=>"Contract" , :foreign_key =>"contract_id"

  has_attached_file :data, :url=>'/system/:attachment/:id/:style/:filename'
  
  private
  #自定义文件名
  def randomize_file_name
    logger.info "the origin file name is #{data_file_name}"
    self.data_origin_file_name = data_file_name
    extension = File.extname(data_file_name).downcase;
    self.data.instance_write(:file_name, "#{Time.now.strftime('%Y%m%d%H%M%S')}#{rand(1000)}#{extension}")
  end

end
