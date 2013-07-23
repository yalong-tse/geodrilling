#encoding: utf-8
class RigmachinesDatatable
  delegate :params, :h,:link_to,:logger, to: :@view

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
        h(rigmachine.devicenumber),
        h(rigmachine.rigmodel),
        h(rigmachine.rigweight),
        h(rigmachine.righoleDeep),
        h(rigmachine.rigPower),
        h(rigmachine.rotatingSpeed),
        h(rigmachine.pipeDiameter),
        h(rigmachine.manufacture),
        h(rigmachine.status)
      ]
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
    columns = %w[devicenumber rigmodel rigweight righoleDeep rigPower rotatingSpeed pipeDiameter manufacture status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
