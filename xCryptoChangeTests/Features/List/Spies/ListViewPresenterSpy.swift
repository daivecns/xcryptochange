import Foundation
@testable import xCryptoChange

final class ListViewPresenterSpy: ListViewPresenting {
    var viewController: ListViewDisplaying?
    
    // MARK: - Execution Counters
    private(set) var presentExchangesDTOCount = 0
    private(set) var presentErrorCount = 0
    private(set) var presentExchangeCount = 0
    
    // MARK: - Execution Received Data
    private(set) var exchangesDTOReceived: [ExchangeDTO]?
    private(set) var errorReceived: ExchangeAPIError?
    private(set) var exchangeReceived: ExchangeViewModel?
    
    // MARK: - Spy Methods
    func present(exchangesDTO: [ExchangeDTO]) {
        presentExchangesDTOCount += 1
        exchangesDTOReceived = exchangesDTO
    }
    
    func present(error: ExchangeAPIError) {
        presentErrorCount += 1
        errorReceived = error
    }
    
    func present(exchange: ExchangeViewModel) {
        presentExchangeCount += 1
        exchangeReceived = exchange
    }
}
