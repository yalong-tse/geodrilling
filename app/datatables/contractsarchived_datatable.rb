#encoding: utf-8
class ContractsarchivedDatatable
  delegate :params, :h, :link_to, :number_to_currency, :logger, :session, to: :@view

  include GlobalFun
  include ContractsUtils


  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Contract.wait_archive.count,
      iTotalDisplayRecords: contracts.total_entries,
      aaData: data
    }
  end

private

  def data
    contracts.map do |contract|
      [
        h(contract.contractno),
        link_to(contract.name, contract),
        h(contract.projectname),
        h(contract.owner),
        h(contract.buyerparty),
        h(contract.contractamount),
        h(regtime(contract.startdate)),
        h(regtime(contract.finishdate)),
        h(contract_status_treat(contract.status))
      ]
    end
  end

  def operation_dealing(args)
    code = ""
    if args
      code << "<button class=\"btn btn-mini btn-primary\" onclick=\"javascript:open_modal('#{args.contractno}','#{args.name}','#{args.projectname}')\">关闭</button>"
    end
    code.html_safe
  end

  def contracts
    @contracts ||= fetch_contracts
  end

  def fetch_contracts
    contracts = querycontracts(sort_column,sort_direction)
    contracts = contracts.archived
    #logger.info("#{sort_column} #{sort_direction}")
    contracts = contracts.page(page).per_page(per_page)
    if params[:sSearch].present?
      contracts = contracts.wait_archive.where("name like :search or projectname like :search or owner like :search or buyerparty like :search ", search: "%#{params[:sSearch]}%")
    end
    contracts
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[contractno name projectname owner buyerparty contractamount startdate finishdate status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
