#encoding: utf-8
module UsersHelper

  def change_account_display_or_not
    code = <<-ACCOUNTFIELD
      $(function(){
        $('#isappuser').click(function() {
          if($('#isappuser').is(":checked")) {
            $('#account_field').attr("class", "control-group");
            $('#role_field').attr("class", "row-fluid");
          } else {
            $('#account_field').attr("class", "control-group hidden");
            $('#role_field').attr("class", "row-fluid hidden");
          }
        });
        if("#{@user.isappuser}" == "true") {
          $('#account_field').attr("class", "control-group");
          $('#role_field').attr("class", "row-fluid");
        }
      });
    ACCOUNTFIELD
    javascript_tag code
  end

  def user_dynatree(args)
    code = <<-DHTMLXTREE
      var tree = new dhtmlXTreeObject("#{args[:tree_id]}", "100%", "100%", 0);
      tree.setImagePath("/assets/dhtmlxtree/imgs/csh_dhx_skyblue/");
      var jsonObject = #{Department.to_dhtmlxtree_node.to_json}
      tree.loadJSONObject(jsonObject);
      tree.attachEvent("onClick", function(itemId) {
        $('#_iframe').attr("src", "/departments/"+itemId+"/users");
        return true;
      });

    DHTMLXTREE
    javascript_tag(code)
  end

  def contactway(user)
    if user.mobile
      user.mobile
    else
      user.officephone
    end
  end

  def human_sex(user)
    if user.sex == 1
      '男'
    else
      '女'
    end
  end

  def is_appuser(user)
    if user.isappuser?
      "是"
    else
      "否"
    end
  end
end
