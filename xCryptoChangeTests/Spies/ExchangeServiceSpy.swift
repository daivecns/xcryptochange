import Foundation
@testable import xCryptoChange

final class ExchangeServiceSpy: ExchangeServicing {
    
    // MARK: - Mocked Response
    var fetchAllExchangesResult: Result<[ExchangeDTO], ExchangeAPIError> = .failure(.unknown)
    
    // MARK: - Execution Counters
    private(set) var fetchAllExchangesCount = 0
    
    // MARK: - Spy Methods
    func fetchAllExchanges(completion: @escaping APIResponse) {
        fetchAllExchangesCount += 1
        completion(fetchAllExchangesResult)
    }
}
