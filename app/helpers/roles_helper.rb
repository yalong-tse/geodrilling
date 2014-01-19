module RolesHelper
  def generate_permissions_output(permissions_array, role_permissions)
    html_code = ""
    permissions_array.each do |permissions_hash|
      html_code << "<tr><td>"
      permissions_hash.each do |key, value|
        html_code << "#{key}</td><td>"
        value.each do |permission|
          if role_permissions
            html_code << "#{check_box_tag 'permission[]', permission.id, role_permissions.include?(permission.id), {array:true, class:'check_box'}}"
          else
            html_code << "#{check_box_tag 'permission[]', permission.id}"
          end
          html_code << "#{permission.name} "
        end
        html_code << "</td>"
      end
    end
    html_code.html_safe
  end

  # 用户角色的规则化显示
  def user_role_treat (roles)
    result =""
    if roles
      roles.each do |role|
        result << role.name 
        result << "<br/>"
      end
    end
    result.html_safe
  end
end
