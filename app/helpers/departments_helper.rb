# encoding: utf-8
module DepartmentsHelper

  def dhtmlxtree_generate(args)
    code = <<-DHTMLXTREE
    $(function(){
      var tree = new dhtmlXTreeObject("#{args[:tree_id]}", "100%", "100%", 0);
      tree.setImagePath("/assets/dhtmlxtree/imgs/");
      var jsonObject = {id:0,
        item:[
              {id:'1', text:'铁科院',
                item:[
                       {id:'2', text:'电子所',
                         item:[
                                {id:'4', text:'智能中心',
                                  item:[
                                         {id:'5', text:'应急组'},
                                         {id:'6', text:'安全组'}
                                       ]
                                }
                              ]
                       },
                       {id:'3', text:'通号所'}
                     ]
              },
              {id:'7', text:'北京铁路局',
                item:[
                       {id:'8', text:'总值班室'},
                     ]
              },
             ]
      };
      tree.loadJSONObject(jsonObject);
    });
    DHTMLXTREE
    javascript_tag(code)
  end

  def dhtmlxtree_dynatree(args)
    code = <<-DHTMLXTREE
      function onButtonClick(menuitemId, type) {
        var id = tree.contextID;
        //tree.setItemColor(id, menuitemId.split('_')[1]);
        //alert(menuitemId);

        if(menuitemId == 'deleteitem') {
          $('#delete_department').attr("href", "/departments/"+id);
          $('#delete_modal').modal('show');
        } else if (menuitemId == "addnewitemnext") {
          var parentid = tree.getParentId(id);
          if (parentid == '0') {
            $('#parent_id').val('');
          } else {
            $('#parent_id').val(parentid);
          }
          $('#selectitem').val(id);
          $('#newitemnext').val('1'); // 增加新同级部门
          $('#modal').modal('show');
        } else if (menuitemId == "addchilditem") {
          $('#parent_id').val(id);
          $('#selectitem').val(id);
          $('#newitemnext').val('0');
          $('#modal').modal('show');
        }
      }


      var menu = new dhtmlXMenuObject();
      menu.setIconsPath("/assets/common/");
      menu.renderAsContextMenu();
      menu.attachEvent("onClick", onButtonClick);
      menu.loadXMLString("<menu id='0'><item text='添加同级部门' id='addnewitemnext' img='plus.png' /><item text='添加子部门' id='addchilditem' img='sitemap.png' /><item text='删除该部门' id='deleteitem' img='remove.png' /></menu>");

      var tree = new dhtmlXTreeObject("#{args[:tree_id]}", "100%", "100%", 0);
      tree.setImagePath("/assets/dhtmlxtree/imgs/");
      tree.enableContextMenu(menu);
      tree.attachEvent("onBeforeContextMenu", function(itemId) {
        if(tree.hasChildren(itemId) > 0) {
          menu.hideItem('deleteitem');
        } else {
          menu.showItem('deleteitem');
        }
        return true;
      });
      // Dynamic Loading
      tree.setXMLAutoLoading("departments/dynamic_tree");
      tree.setDataMode("json");
      tree.loadJSON("departments/dynamic_tree?id=0");

      // Load Once
      // var jsonObject = #{Department.to_dhtmlxtree_node.to_json}
      // tree.loadJSONObject(jsonObject);
      tree.attachEvent("onClick", function(nodeId){
        $('#_iframe').attr("src","/departments/"+nodeId);
        return true;
      });

    DHTMLXTREE
    javascript_tag(code)
  end

  def dhtmlxtree_dynatree2(args)
    code = <<-DHTMLXTREE
      var tree = new dhtmlXTreeObject("#{args[:tree_id]}", "100%", "100%", 0);
      tree.setImagePath("/assets/dhtmlxtree/imgs/");
      // Dynamic Loading
      tree.setXMLAutoLoading("departments/dynamic_tree");
      tree.setDataMode("json");
      tree.loadJSON("departments/dynamic_tree?id=0");

      // Load Once
      // var jsonObject = #{Department.to_dhtmlxtree_node.to_json}
      // tree.loadJSONObject(jsonObject);
      tree.attachEvent("onClick", function(nodeId){
        $('#_iframe').attr("src","/departments/"+nodeId);
        return true;
      });

    DHTMLXTREE
    javascript_tag(code)
  end

  def init_modal
    javascript = <<-MODAL
      $(function(){

        $('#modal').modal('hide');
        $('#cancel_action').click(function() {
          $('#modal').modal('toggle');
          return false;
        });
      });
    MODAL
    javascript_tag(javascript)
  end

  def hide_modal
    code = <<-HIDEMODAL
      function hideModal() {
        $('#modal').modal('hide');
      }
    HIDEMODAL
    javascript_tag(code)
  end

  def get_children_for_root(all_nodes)
    # not needed for this example, could just call
    # add-children direct
    boo = {}
    boo = add_children(Department.find(1), all_nodes)
    
  end

  def add_children(parent, all_nodes)
    data = {:data => parent.name}
    data[:children] = children = []

    # cycle round all the nodes and check if they
    # are child of the parent_id
    all_nodes.each_with_index do |node, index|
      if( parent.id == node.parent_id )
        children << add_children(node, all_nodes)
      end

      # Note there is no "break" condition as is
      # usually required in any recursive function...
      # (my data is never going to be infinite though...
    end

    if children.empty?
      data.delete(:children)
    end
    return data
  end
end
