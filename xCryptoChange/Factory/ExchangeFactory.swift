import UIKit

enum ExchangeFactory {
    static func make(with service: ExchangeServicing) -> ListViewController {
        let presenter = ListViewPresenter()
        let interactor = ListViewInteractor(presenter: presenter, service: service)
        let viewController = ListViewController(coordinator: ExchangeCoordinator(), interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
    
    static func make(with exchange: ExchangeViewModel) -> DetailsViewController {
        let presenter = DetailsViewPresenter()
        let interactor = DetailsViewInteractor(presenter: presenter)
        let viewController = DetailsViewController(exchange: exchange, interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
