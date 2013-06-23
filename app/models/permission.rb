class Permission < ActiveRecord::Base
  attr_accessible :action, :description, :name, :subject_class

  def self.format_permissions_output(permissions)
    arr = []
    unless permissions
      Permission.select(:subject_class).map(&:subject_class).uniq.each do |subject_class|
        arr << { subject_class => Permission.find_all_by_subject_class(subject_class)}
      end
      arr
    else
      permissions.map(&:subject_class).uniq.each do |x|
        arr << { x => permissions.select{|y| y.subject_class==x}}
      end
    end
    arr
  end
  
  def self.count_rowspans_for_view(permissions)
    rowspan = permissions.map{|p| p.subject_class}.uniq
    rowspan.length + 1
  end
end

