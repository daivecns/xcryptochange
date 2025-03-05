import UIKit

// MARK: - Presenter Protocol
protocol DetailsViewPresenting: AnyObject {
    var viewController: DetailsViewDisplaying? { get set }
    
    func presenterDetails(of exchange: ExchangeViewModel)
}

// MARK: - Details View Presenter
final class DetailsViewPresenter: DetailsViewPresenting {
    var viewController: DetailsViewDisplaying?
    
    func presenterDetails(of exchange: ExchangeViewModel) {
        viewController?.displayDetails(of: exchange)
    }
}
