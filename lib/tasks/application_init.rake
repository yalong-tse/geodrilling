# encoding: utf-8
namespace 'app' do
  desc "initial the application: e.g. load some init data, etc."
  task(:init => :environment) do
    unless Department.find_by_depcode("001")
      Department.create(:name => "地勘四院", :depcode => "001")
      Department.create(:name => "综合部门", :depcode => "001001", :parent => Department.find_by_name("地勘四院"))
      Department.create(:name => "地勘四院仓库", :depcode => "001001001", :parent => Department.find_by_depcode("001001"))
      Department.create(:name => "矿源公司", :depcode => "002")
      Department.create(:name => "综合部门", :depcode => "002001", :parent => Department.find_by_name("矿源公司"))

      User.create(:name => "系统管理员", :account => "admin", :sex => 1, :password => "1", :password_confirmation => "1", )
    
  end
end
