#encoding: utf-8
#用于班报修改的界面
class TourreportsmodifyDatatable
  delegate :params, :h,:link_to,:tourreports_path,:edit_tourreport_path,:logger, to: :@view

  def initialize(view,holeid)
    @view = view
    @holeid = holeid
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Tourreport.gettourreports(@holeid).count,
      iTotalDisplayRecords: tourreports.total_entries,
      aaData: data
    }
  end

private

  def data
    tourreports.map do |report|
      [
        h(report.hole.holenumber),
        h(report.tourdate.strftime("%Y-%m-%d")),
        h(report.starttime.strftime("%H:%M")),
        h(report.finishtime.strftime("%H:%M")),
        h(report.administrator),
        h(report.tourleader),
        h(report.recorder),
        h(report.tourshift),
        h(report.tourcore),
        h(report.tourdrillingtime),
        h(report.tourauxiliarytime),
        h(detail_button(report))
      ]
    end
  end

  def tourreports
    @tourreports ||= fetch_tourreports
  end

  def detail_button(report)
    code = "<div class=\"inline position-relative btn-group\">"
    code << "<button class=\"btn btn-mini btn-info tooltip-success\" onclick='open_tourreports(\"" + edit_tourreport_path+"/"+report.id.to_s + "\")' rel=\"tooltip\" title=\"班报修改\")'><i class=\"icon-list bigger-120\"></i></button>"
    code << "</div>"
    code.html_safe
  end

  def fetch_tourreports
    tourreports = Tourreport.gettourreports(@holeid).order("#{sort_column} #{sort_direction}")
    tourreports = tourreports.page(page).per_page(per_page)
    if params[:sSearch].present?
      tourreports = tourreports.joins(:hole).where("holes.holenumber like :search or tourdate like :search or administrator like :search or tourleader like :search or recorder like :search", search: "%#{params[:sSearch]}%")
    end
    tourreports 
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[holeid tourdate starttime finishtime administrator tourleader recorder tourshift tourcore tourdrillingtime tourauxiliarytime]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end