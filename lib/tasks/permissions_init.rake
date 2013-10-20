#encoding: utf-8
namespace 'permissions' do
  desc "Loading all models and their related controller methods in permissions table."
  task(:init => :environment) do
    arr = []
    # load all the controllers
    controllers = Dir.new("#{Rails.root}/app/controllers").entries.sort  # 按ASCII码排序
    # or Dir.new(...).entries.sort_by{ |a| File.stat(a).mtime} 按文件修改时间排序
    controllers.each do |entry|
      if entry=~ /_controller/
        # check if the controller is valid
        arr << entry.camelize.gsub('.rb','').constantize
      elsif entry =~ /^[a-z]*$/ # namescoped controllers
        Dir.new("#{Rails.root}/app/controllers/#{entry}").entries.each do |x|
          if x =~ /_controller/
            arr << "#{entry.titleize}::#{x.camelize.gsub('.rb', '')}".constantize
          end
        end
      end
    end

    write_permission("all", "manager", "全部") # 增加"全部"权限添加的入口

    arr.each do |controller|
      # only that controller which represents a model
      if controller.permission
        # create a universal permission for that model. e.g. "manage User" will allow all actions on User model.
        write_permission(controller.permission, "manage", "全部") # add permission to do CRUD for every model.
        controller.action_methods.each do |method|
          if method =~ /^([A-Za-z\d*]+)+([\w]*)+([A-Za-z\d*]+)$/ # add_user, add_user_info, Add_user, add-User
            name, cancan_action = eval_cancan_action(method)
            write_permission(controller.permission, cancan_action, name)
          end
        end
      end
    end
  end
end

# this method returns the cancan action for the action passed.
def eval_cancan_action(action)
  case action.to_s
  when "index", "show", "search", "main","indexforclose","resume"
    name = "查看"
    cancan_action = "read"
    action_desc = "查看"
  when "create", "new", "stockin", "stockout","discard","group"
    name = "新建"
    cancan_action = "add"
    action_desc = "新建"
  when "edit", "update", "indexformodify"
    name = "修改"
    cancan_action = "modify"
    action_desc = "修改"
  when "delete", "destroy", "destroy_multiple"
    name = "删除"
    cancan_action = "delete"
    action_desc = "删除"
  else
    name = action.to_s
    cancan_action = action.to_s
    action_desc = "Other: " < cancan_action
  end
  return name, cancan_action
end

# check if the permission is present else add a new one.
def write_permission(model, cancan_action, name)
  permission = Permission.find(:first, :conditions => ["subject_class = ? and action = ?", model, cancan_action])
  unless permission
    permission = Permission.new
    permission.name = name
    permission.subject_class = model
    permission.action = cancan_action
    permission.save
  end
end
