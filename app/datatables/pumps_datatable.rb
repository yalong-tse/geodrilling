#encoding: utf-8
class PumpsDatatable
  delegate :params, :h,:link_to,:logger, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Pump.count,
      iTotalDisplayRecords: pumps.total_entries,
      aaData: data
    }
  end

private

  def data
    pumps.map do |pump|
      [
        h(pump.devicenumber),
        h(pump.pumpmodel),
        h(pump.officialcode),
        h(pump.pumpDiameter),
        h(pump.traffic),
        h(pump.weight),
        h(pump.power),
        h(pump.pressure),
        h(pump.overallsize),
        h(getstatus(pump))
      ]
    end
  end

  def getstatus(pump)
    if pump 
      deployment = Deployment.where(:pump_id=>pump.id).first
      if deployment
          if (deployment.hole)
            return "钻孔编号:"+ deployment.hole.holenumber 
          else
            return "空闲"
          end
      else
        return "空闲"
      end
    end
  end

  def pumps
    @pumps ||= fetch_pumps
  end

  def fetch_pumps
    pumps = Pump.order("#{sort_column} #{sort_direction}")
    pumps = pumps.page(page).per_page(per_page)
    if params[:sSearch].present?
      pumps = pumps.where("pumpmodel like :search or pumpDiameter like :search or officialcode like :search or devicenumber like :search or weight like :search or power like :search", search: "%#{params[:sSearch]}%")
    end
    pumps 
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[devicenumber pumpmodel officialcode pumpDiameter traffic weight power pressure overallsize status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
