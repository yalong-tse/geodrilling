class Attachment < ActiveRecord::Base
  attr_accessible :filename, :filetype, :savefilename, :savepath

  # 保存的model 方法 
  def save_att(file)
    if !file.nil?
      filename = file.original_filename
      if !filename.nil?
        name = File.basename(filename)
        logger.info "the name is #{name}"
        rename = UUIDTools::UUID.random_create.to_s.gsub("-","")
        str = name.split('.');
        save_path = Appsetting.where(:name=>'attachment_savepath')
        rename="#{rename}.#{str[1]}"
        fullname = "#{save_path}/#{rename}"
        File.open("#{fullname}","wb") do |f|
          f.write(file.read)
        end 
        self.filename = filename
        self.filetype = str.last
        self.savefilename = rename
        self.savepath = save_path
        rename
      end
    end
  end
end
