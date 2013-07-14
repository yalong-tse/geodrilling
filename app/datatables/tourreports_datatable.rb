#encoding: utf-8
class TourreportsDatatable
  delegate :params, :h,:link_to,:logger, to: :@view

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
        h(report.tourauxiliarytime)
      ]
    end
  end

  def tourreports
    @tourreports ||= fetch_tourreports
  end

  def fetch_tourreports
    tourreports = Tourreport.gettourreports(@holeid).order("#{sort_column} #{sort_direction}")
    tourreports = tourreports.page(page).per_page(per_page)
    if params[:sSearch].present?
      tourreports = tourreports.joins(:hole).where("holes.holenumber like :search or tourdate like :search or administrator like :search or tourleader like :search", search: "%#{params[:sSearch]}%")
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
    columns = %w[tourdate starttime finishtime administrator tourleader recorder tourshift tourcore tourdrillingtime tourauxiliarytime]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
