class ContractsDatatable
  delegate :params, :h, :link_to, :number_to_currency, :logger, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Contract.count,
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
        number_to_currency(contract.contractamount),
        h(contract.signdate.strftime("%Y-%m-%e")),
        h(contract.startdate.strftime("%Y-%m-%e")),
        h(contract.finishdate.strftime("%Y-%m-%e")),
        h(contract.status)
        #h(product.released_on.strftime("%B %e, %Y")),
        #number_to_currency(product.price)
      ]
    end
  end

  def contracts
    @contracts ||= fetch_contracts
  end

  def fetch_contracts
    contracts = Contract.order("#{sort_column} #{sort_direction}")
    logger.info("#{sort_column} #{sort_direction}")
    contracts = contracts.page(page).per_page(per_page)
    if params[:sSearch].present?
      contracts = contracts.where("name like :search or projectname like :search or owner like :search or buyerparty like :search ", search: "%#{params[:sSearch]}%")
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
    columns = %w[name projectname owner buyerparty contractamount signdate startdate finishdate status]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
