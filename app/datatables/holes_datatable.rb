#encoding: utf-8
class HolesDatatable
  delegate :params, :h,:hole_path, :tourreports_path, :link_to, :number_to_currency, :logger, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Hole.count,
      iTotalDisplayRecords: holes.total_entries,
      aaData: data
    }
  end

private

  def data
    holes.map do |hole|
      [
        h(hole.minearea),
        h(hole.holenumber),
        h(hole.designdeep),
        h(hole.designdiameter),
        h(hole.startdate.strftime("%Y-%m-%d")),
        h(hole.finishdate.strftime("%Y-%m-%d")),
        h(detail_button(hole))
      ]
    end
  end

  def detail_button(hole)
    code = "<div class=\"inline position-relative btn-group\">"
    code << "<button class=\"btn btn-mini btn-success tooltip-success\" onclick='open_detail(\"" + hole_path(hole,:format=>:json)  + "\")' rel=\"tooltip\" title=\"查看详情\")'><i class=\"icon-eye-open bigger-120\"></i></button>"
    code << "<button class=\"btn btn-mini btn-warning tooltip-success\" onclick='open_tourreports(\"" + tourreports_path+"?holeid="+hole.id.to_s + "\")' rel=\"tooltip\" title=\"查看班报\")'><i class=\"icon-calendar bigger-120\"></i></button>"
    code << "</div>"
    code.html_safe
  end

  def holes
    @holes ||= fetch_holes
  end

  def fetch_holes
    holes = Hole.order("#{sort_column} #{sort_direction}")
    holes = holes.page(page).per_page(per_page)
    if params[:sSearch].present?
      holes = holes.where("minearea like :search or holenumber like :search ", search: "%#{params[:sSearch]}%")
    end
    holes
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[minearea holenumber designdeep designdiameter startdate finishdate]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
