# encoding: utf-8
namespace 'permissions' do
  desc "Remove all records in permission's table in the database."
  task(:clear => :environment) do
    Role.all.each do |role|
      role.permissions.clear
    end
    # Permission.destroy_all
    Permission.delete_all
    
  end
end
