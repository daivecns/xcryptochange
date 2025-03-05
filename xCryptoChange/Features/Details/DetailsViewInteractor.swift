// MARK: - Interactor Protocol
protocol DetailsViewInteracting {
    func load(exchange: ExchangeViewModel)
}

// MARK: - Details View Interactor
struct DetailsViewInteractor {
    let presenter: DetailsViewPresenting
    
    init(presenter: DetailsViewPresenting) {
        self.presenter = presenter
    }
}

// MARK: - DetailsInteracting
extension DetailsViewInteractor: DetailsViewInteracting {
    func load(exchange: ExchangeViewModel) {
        presenter.presenterDetails(of: exchange)
    }
}
