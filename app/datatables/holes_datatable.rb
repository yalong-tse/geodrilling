#encoding: utf-8
class HolesDatatable
  delegate :params, :h,:hole_path, :holes_close_path, :tourreports_path, :new_tourreport_path, :schedule_index_path,:link_to, :number_to_currency, :logger, to: :@view

  include GlobalFun

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
        h(holenumber_dealing(hole.id)),
        h(hole.contract.name),
        h(hole.designdeep),
        h(hole.actualdeep),
        h(hole.designcoreratio),
        h(hole.actualcoreratio),
        h(hole.startdate.strftime("%Y-%m-%d")),
        h(hole_status_treat(hole.status)),
        h(detail_button(hole))
      ]
    end
  end

  def detail_button(hole)
    code = "<div class=\"inline position-relative btn-group\">"
    code << "<button class=\"btn btn-mini btn-success tooltip-success\" onclick='open_detail(\"" + hole_path(hole)  + "\")' rel=\"tooltip\" title=\"查看详情\")'><i class=\"icon-eye-open bigger-120\"></i></button>"
    if(hole.status.nil? || hole.status==1)
      code << "<button class=\"btn btn-mini btn-success tooltip-success\" onclick='open_detail(\""+ holes_close_path + "?id="+hole.id.to_s+"\")' rel=\"tooltip\" title=\"钻孔终孔\")'><i class=\"icon-cogs bigger-120\"></i></button>"
    end
    code << "</div>"
    code.html_safe
  end

  def holes
    @holes ||= fetch_holes
  end

  def fetch_holes
    holes = Hole.unclosed.order("#{sort_column} #{sort_direction}")
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
    columns = %w[holenumber minearea designdeep actualdeep designcoreratio actualcoreratio startdate status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end
