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
    Permission.create({:name=>"领导关注钻孔情况",:description=>"领导关注钻孔情况", :subject_class=>"Leader", :action=>"holeproduct"})
    Permission.create({:name=>"钻孔统计",:description=>"钻孔统计的情况", :subject_class=>"Chart", :action=>"hole"})
  end
end

# this method returns the cancan action for the action passed.
