import UIKit
@testable import xCryptoChange

final class DetailsViewControllerSpy: DetailsViewDisplaying {
    
    // MARK: - Execution Counters
    private(set) var displayDetailsCount = 0
    
    // MARK: - Execution Received Data
    private(set) var exchangeReceived: ExchangeViewModel?
    
    // MARK: - Spy Methods
    func displayDetails(of exchange: ExchangeViewModel) {
        displayDetailsCount += 1
        exchangeReceived = exchange
    }
}
