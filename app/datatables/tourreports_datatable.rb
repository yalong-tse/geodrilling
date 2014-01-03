#encoding: utf-8
class TourreportsDatatable
  delegate :params, :h,:link_to,:tourreport_path, :logger, to: :@view

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
        h(renderhole(report)),
        h(report.tourdate.strftime("%Y-%m-%d")),
        h(report.starttime.strftime("%H:%M")),
        h(report.finishtime.strftime("%H:%M")),
        h(finduser(report.projectmanager)),
        h(finduser(report.administrator)+"/"+finduser(report.tourleader)),
        h(report.recorder),
        h(report.tourshift),
        h(report.tourcore),
        h(report.tourdrillingtime),
        h(report.tourauxiliarytime),
        h(detail_button(report))
      ]
    end
  end

  # 判断userid is nil 的情况
  def finduser(userid)
    logger.info "the userid is #{userid}"
    if userid && !userid.nil? && !userid.empty?
      user = User.find(userid)
      if user 
        return user.name
      else
        return ""
       end
    end
    return ""
  end

  def renderhole(report)
    code = ""
    if report
      if report.source==1
        code << "<i class='icon-file red bigger-120'></i> " + report.hole.holenumber
      elsif report.source==2
        code << "<i class='icon-cloud-upload green bigger-120'></i> " + report.hole.holenumber
      else
        code << "<i class='icon-file red bigger-120'></i> " + report.hole.holenumber
      end
    end
    code.html_safe
  end

  def tourreports
    @tourreports ||= fetch_tourreports
  end

  def detail_button(report)
    code = "<div class=\"inline position-relative btn-group\">"
    code << "<button class=\"btn btn-mini btn-info tooltip-success\" onclick='open_tourreports(\"" + tourreport_path(report) + "\")' rel=\"tooltip\" title=\"班报详情\")'><i class=\"icon-list bigger-120\"></i></button>"
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
