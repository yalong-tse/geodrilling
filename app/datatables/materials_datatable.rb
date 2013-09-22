#encoding: utf-8
class MaterialsDatatable
  delegate :params, :h,:link_to,:logger, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Material.count,
      iTotalDisplayRecords: materials.total_entries,
      aaData: data
    }
  end

private

  def data
    materials.map do |m|
      [
        h(regular_hole(m)),
        h(m.name),
        h(m.model),
        h(m.price),
        h(m.count),
        h(m.stockdate),
        h(m.manufacture)
      ]
    end
  end

  def regular_hole(m)
    if (m)
      if(m.hole)
        m.hole.holenumber
      else
        ""
      end
    end
  end

  def materials
    @materials ||= fetch_materials
  end

  def fetch_materials
    materials = Material.order("#{sort_column} #{sort_direction}")
    materials = materials.page(page).per_page(per_page)
    if params[:sSearch].present?
      materials = materials.where("name like :search or model like :search or manufacture like :search or recorder like :search or price like :search ", search: "%#{params[:sSearch]}%")
    end
    materials 
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[holeid name model price count stockdate manufacture]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
