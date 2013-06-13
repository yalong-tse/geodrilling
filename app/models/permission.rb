class Permission < ActiveRecord::Base
  attr_accessible :action, :description, :name, :subject_class

  def self.format_permissions_output
    arr = []
    Permission.select(:subject_class).map(&:subject_class).uniq.each do |subject_class|
      arr << { subject_class => Permission.find_all_by_subject_class(subject_class)}
    end
    arr
  end
end

