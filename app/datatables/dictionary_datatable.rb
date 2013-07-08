#encoding: utf-8
class DictionaryDatatable
  delegate :params, :h, :link_to, :number_to_currency, :logger, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Dictionary.count,
      iTotalDisplayRecords: dictionary.total_entries,
      aaData: data
    }
  end

private

  def data
    dictionary.map do |dic|
      [
        h(dic.item),
        h(dic.dictype),
        h(dic.priority),
        h(dictionary_delflag(dic.delflag))
      ]
    end
  end

  # 字典删除标识处理
  def dictionary_delflag(arg)
    result = ""
    case arg
    when "0"
      result ="<span class='label label-success arrowed-in'>可用</span>"
    when nil
      result = "<span class='label label-success arrowed-in'>可用</span>"
    when "1"
      result = "<span class='label label-warning arrowed-in'>不可用</span>"
    end
    result.html_safe
  end

  def dictionary 
    @dictionary ||= fetch_dictionary
  end

  def fetch_dictionary
    dictionary = Dictionary.order("#{sort_column} #{sort_direction}")
    logger.info("#{sort_column} #{sort_direction}")
    dictionary = dictionary.page(page).per_page(per_page)
    if params[:sSearch].present?
      dictionary = dictionary.where("item like :search or dictype like :search or priority like :search", search: "%#{params[:sSearch]}%")
    end
    dictionary
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[item dictype priority delflag]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
