import UIKit

// MARK: - Exchange Coordinator Protocol
protocol ExchangeCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func openDetails(of exchange: ExchangeViewModel)
}

// MARK: - Exchange Coordinator
final class ExchangeCoordinator: ExchangeCoordinating {
    var viewController: UIViewController?

    func openDetails(of exchange: ExchangeViewModel) {
        viewController?.navigationController?.pushViewController(ExchangeFactory.make(with: exchange), animated: true)
    }
}
