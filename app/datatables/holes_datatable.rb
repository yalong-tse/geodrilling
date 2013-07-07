#encoding: utf-8
class HolesDatatable
  delegate :params, :h, :link_to, :number_to_currency, :logger, to: :@view

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
        h(hole.startdate.strftime("%Y-%m-%e")),
        h(hole.finishdate.strftime("%Y-%m-%e")),
        h(detail_button)
      ]
    end
  end

  def detail_button
    code =<<-END_OF_CODE
      <button class="btn btn-small btn-info" onclick='open_detail("<%=hole_path(hole,:format=>:json) %>")'><i class="icon-th"></i></button>
    END_OF_CODE
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
