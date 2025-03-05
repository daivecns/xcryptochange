// MARK: - Interactor Protocol
protocol ListViewInteracting {
    func fetchData()
    func didSelected(exchange: ExchangeViewModel)
}

// MARK: - List Interactor
final class ListViewInteractor {
    // MARK: - Private Properties
    private let presenter: ListViewPresenting
    private let service: ExchangeServicing
    
    // MARK: - Initialization
    init(presenter: ListViewPresenting,
         service: ExchangeServicing) {
        self.presenter = presenter
        self.service = service
    }
}

// MARK: - List Interacting
extension ListViewInteractor: ListViewInteracting {
    func fetchData() {
        fetchExchanges()
    }
    
    func didSelected(exchange: ExchangeViewModel) {
        presenter.present(exchange: exchange)
    }
}

// MARK: - Private Helpers
private extension ListViewInteractor {
    func fetchExchanges() {
        service.fetchAllExchanges { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let exchangesDTO):
                presenter.present(exchangesDTO: exchangesDTO)
                
            case .failure(let error):
                presenter.present(error: error)
            }
        }
    }
}
