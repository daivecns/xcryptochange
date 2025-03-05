import Foundation
@testable import xCryptoChange
import UIKit

final class ExchangeCoordinatorSpy: ExchangeCoordinating {
    var viewController: UIViewController?
    
    // MARK: - Execution Counters
    private(set) var openDetailsCount = 0
    
    // MARK: - Execution Received Data
    private(set) var exchangeReceived: ExchangeViewModel?
    
    // MARK: - Spy Methods
    func openDetails(of exchange: ExchangeViewModel) {
        openDetailsCount += 1
        exchangeReceived = exchange
    }
}
