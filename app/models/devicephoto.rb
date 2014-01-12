class Devicephoto < ActiveRecord::Base
  attr_accessible :data_content_type, :data_file_name, :data_file_size, :data_origin_file_name, :data_update_at,:data

  before_create :randomize_file_name
  before_update :randomize_file_name


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
