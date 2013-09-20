#encoding: utf-8
class DrilltowersDatatable
  delegate :params, :h,:link_to,:logger, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Drilltower.count,
      iTotalDisplayRecords: drilltowers.total_entries,
      aaData: data
    }
  end

private

  def data
    drilltowers.map do |tower|
      [
        h(tower.devicenumber),
        h(tower.model),
        h(tower.effectiveload),
        h(tower.deep),
        h(tower.height),
        h(tower.pipequantityAndLenght),
        h(tower.sheaveQuantity),
        h(tower.topsize),
        h(tower.weight),
        h(tower.manufacture),
        h(getstatus(tower))
      ]
    end
  end

  def getstatus(tower)
    if tower
      deployment = Deployment.where(:drilltower_id=>tower.id).first
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

  def drilltowers
    @drilltowers ||= fetch_drilltowers
  end

  def fetch_drilltowers
    drilltowers = Drilltower.order("#{sort_column} #{sort_direction}")
    drilltowers = drilltowers.page(page).per_page(per_page)
    if params[:sSearch].present?
      drilltowers = drilltowers.where("manufacture like :search or rigPower like :search or rigweight like :search or manufactureContact like :search or rigmodel like :search or righoleDeep like :search", search: "%#{params[:sSearch]}%")
    end
    drilltowers 
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[devicenumber model effectiveload deep height pipequantityAndLenght sheaveQuantity topsize weight manufacture status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
