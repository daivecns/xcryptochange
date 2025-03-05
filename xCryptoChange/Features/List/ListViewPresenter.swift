import Foundation

// MARK: - List View Presenter Protocol
protocol ListViewPresenting: AnyObject {
    var viewController: ListViewDisplaying? { get set }
    
    func present(exchangesDTO: [ExchangeDTO])
    func present(error: ExchangeAPIError)
    func present(exchange: ExchangeViewModel)
}

// MARK: - List View Presenter
final class ListViewPresenter: ListViewPresenting {
    var viewController: ListViewDisplaying?
    
    func present(exchangesDTO: [ExchangeDTO]) {
        let viewModel = dtoToViewModel(exchangesDTO)
        viewController?.display(state: .list(viewModel))
    }
    
    func present(error: ExchangeAPIError) {
        viewController?.display(state: .error(error))
    }
    
    func present(exchange: ExchangeViewModel) {
        viewController?.display(state: .display(exchange))
    }
}

// MARK: - Private Helpers
private extension ListViewPresenter {
    func dtoToViewModel(_ dto: [ExchangeDTO]) -> [ExchangeViewModel] {
        var viewModel = [ExchangeViewModel]()
        
        dto.forEach { exchangeDTO in
            viewModel.append(ExchangeViewModel(dto: exchangeDTO))
        }
        
        return viewModel.sorted { $0.exchangeID < $1.exchangeID }
    }
}
