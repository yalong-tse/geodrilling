#encoding: utf-8
namespace 'permissions' do
  desc "first init all permissions"
  task(:first => :environment) do
    Permission.delete_all
    Permission.create({:name=>"合同列表",:description=>"合同列表权限", :subject_class=>"Contract",:action=>"index"})
    Permission.create({:name=>"新增合同",:description=>"新增合同权限", :subject_class=>"Contract", :action=>"new"})
    Permission.create({:name=>"合同关闭",:description=>"合同关闭和归档", :subject_class=>"Contract", :action=>"indexforclose"})
    Permission.create({:name=>"新增钻孔",:description=>"新增钻孔", :subject_class=>"Hole", :action=>"new"})
    Permission.create({:name=>"钻孔配置",:description=>"钻孔配置", :subject_class=>"Hole", :action=>"deployment"})
    Permission.create({:name=>"钻孔查询",:description=>"钻孔查询", :subject_class=>"Hole", :action=>"index"})
    Permission.create({:name=>"班报填写",:description=>"班报填写", :subject_class=>"Tourreport", :action=>"new"})
    Permission.create({:name=>"班报修改",:description=>"班报修改", :subject_class=>"Tourreport", :action=>"edit"})
    Permission.create({:name=>"班报查询",:description=>"班报查询", :subject_class=>"Tourreport", :action=>"index"})
    Permission.create({:name=>"设备存库",:description=>"设备库存", :subject_class=>"Equipment", :action=>"index"})
    Permission.create({:name=>"设备入库",:description=>"设备入库", :subject_class=>"Equipment", :action=>"stockin"})
    Permission.create({:name=>"设备处理",:description=>"设备处理", :subject_class=>"Equipment", :action=>"discard"})
    Permission.create({:name=>"材料库存",:description=>"材料库存", :subject_class=>"Material", :action=>"index"})
    Permission.create({:name=>"材料入库",:description=>"材料入库", :subject_class=>"Material", :action=>"new"})
    Permission.create({:name=>"材料消耗",:description=>"材料消耗", :subject_class=>"Material", :action=>"stockout"})
    Permission.create({:name=>"合同统计",:description=>"合同统计", :subject_class=>"Chart", :action=>"contract"})
    Permission.create({:name=>"钻孔统计",:description=>"钻孔统计的情况", :subject_class=>"Chart", :action=>"hole"})
    Permission.create({:name=>"领导关注钻孔情况",:description=>"领导关注钻孔情况", :subject_class=>"Leader", :action=>"holeproduct"})
    Permission.create({:name=>"领导关注合同情况",:description=>"领导关注合同情况", :subject_class=>"Leader", :action=>"contract"})
    Permission.create({:name=>"合同归档",:description=>"合同归档", :subject_class=>"archive", :action=>"contract"})
    Permission.create({:name=>"钻孔归档",:description=>"钻孔归档", :subject_class=>"archive", :action=>"hole"})
    Permission.create({:name=>"部门管理",:description=>"部门管理", :subject_class=>"department", :action=>"index"})
    Permission.create({:name=>"人员管理",:description=>"人员管理", :subject_class=>"user", :action=>"index"})
    Permission.create({:name=>"人员配组",:description=>"人员配组", :subject_class=>"group", :action=>"index"})
    Permission.create({:name=>"角色管理",:description=>"角色管理", :subject_class=>"role", :action=>"index"})
    Permission.create({:name=>"字典管理",:description=>"字典管理", :subject_class=>"dictionary", :action=>"index"})
  end
end

# this method returns the cancan action for the action passed.