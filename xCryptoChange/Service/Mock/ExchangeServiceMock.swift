import Foundation

// MARK: - CoinAPI Keys
fileprivate let COINAPI_URL    = "https://rest.coinapi.io"
fileprivate let HEADER_API_KEY = "X-CoinAPI-Key"
fileprivate let API_KEY        = "6781f60f-13f4-4296-baaa-90223c1db8cf"

final class ExchangeServiceMock: ExchangeServicing {
    
    func fetchAllExchanges(completion: @escaping APIResponse) {
        if UITestingInfo.isTestingInvalidRequestState {
            completion(.failure(.invalidRequest))
            return
        }
        
        guard let requestUrl = URL(string: COINAPI_URL.appending("/v1/exchanges")) else {
            completion(.failure(.invalidRequest))
            return
        }
            
        let request = NSMutableURLRequest(url: requestUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 100)
        request.httpMethod = "GET"
        
        perform(request: request as URLRequest, completion: completion)
    }
}

// MARK: - Private Methods
private extension ExchangeServiceMock {
    func perform(request _request: URLRequest, completion: @escaping APIResponse) {
        let session = URLSession(configuration: .default)
        let _ = session.dataTask(with: _request) { [weak self] (data: Data?, response: URLResponse?, error: Error?) in
            guard let self else { return }
            
            if UITestingInfo.isTestingNotConnectedState {
                completion(.failure(.notConnected))
                return
            }
            
            if UITestingInfo.isTestingUnknownFailureState {
                completion(.failure(.unknown))
                return
            }
            
            if UITestingInfo.isTestingInvalidJSONState {
                completion(.failure(.invalidJSON))
                return
            }
        }.resume()
    }
}
