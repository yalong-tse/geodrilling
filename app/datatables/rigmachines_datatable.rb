#encoding: utf-8
class RigmachinesDatatable
  delegate :params, :h,:link_to,:logger, :rigmachine_show_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Rigmachine.count,
      iTotalDisplayRecords: rigmachines.total_entries,
      aaData: data
    }
  end

private

  def data
    rigmachines.map do |rigmachine|
      [
        h(detail(rigmachine)),
        h(rigmachine.rigmodel),
        h(rigmachine.officialcode),
        h(rigmachine.rigweight),
        h(rigmachine.righoleDeep),
        h(rigmachine.rigPower),
        h(rigmachine.pipeDiameter),
        h(rigmachine.manufacture),
        h(getstatus(rigmachine))
      ]
    end
  end

  def detail(rigmachine)
    code = "<a href=" + rigmachine_show_path + "?id=" + rigmachine.id.to_s + ">" + rigmachine.devicenumber + "</a>"
    code.html_safe
  end

  def getstatus(rigmachine)
    if rigmachine
      deployment = Deployment.where(:rigmachine_id=>rigmachine.id).first
      if(deployment)
        hole = Hole.find(deployment.hole_id) 
        if hole
          return "钻孔编号：" + hole.holenumber
        else
          return "空闲"
        end
      else
        return "空闲"
      end

    end
  end

  def rigmachines
    @rigmachines ||= fetch_rigmachines
  end

  def fetch_rigmachines
    rigmachines = Rigmachine.order("#{sort_column} #{sort_direction}")
    rigmachines = rigmachines.page(page).per_page(per_page)
    if params[:sSearch].present?
      rigmachines = rigmachines.where("manufacture like :search or rigPower like :search or rigweight like :search or manufactureContact like :search or rigmodel like :search or righoleDeep like :search", search: "%#{params[:sSearch]}%")
    end
    rigmachines 
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[devicenumber rigmodel officialcode rigweight righoleDeep rigPower pipeDiameter manufacture status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
