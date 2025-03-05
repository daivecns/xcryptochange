import Foundation
@testable import xCryptoChange

final class DetailsViewPresenterSpy: DetailsViewPresenting {
    var viewController: DetailsViewDisplaying?
    
    // MARK: - Execution Counters
    private(set) var presenterDetailsCount = 0
    
    // MARK: - Execution Received Data
    private(set) var exchangeReceived: ExchangeViewModel?

    // MARK: - Spy Methods
    func presenterDetails(of exchange: ExchangeViewModel) {
        presenterDetailsCount += 1
        exchangeReceived = exchange
    }
}
