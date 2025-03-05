import Foundation

// MARK: - CoinAPI Keys
fileprivate let COINAPI_URL    = "https://rest.coinapi.io"
fileprivate let HEADER_API_KEY = "X-CoinAPI-Key"
fileprivate let API_KEY        = "6781f60f-13f4-4296-baaa-90223c1db8cf"

// MARK: - Aliases
typealias APIResponse = (Result<[ExchangeDTO], ExchangeAPIError>) -> Void

// MARK: - Exchange Service Protocol
protocol ExchangeServicing {
    func fetchAllExchanges(completion: @escaping APIResponse)
}

// MARK: - Error Handling
enum ExchangeAPIError: Error {
    case invalidRequest
    case invalidJSON
    case notConnected
    case unknown
    
    var image: String {
        switch self {
        case .invalidRequest: return Strings.Errors.InvalidRequest.image
        case .invalidJSON: return Strings.Errors.InvalidJSON.image
        case .notConnected: return Strings.Errors.NotConnected.image
        case .unknown: return Strings.Errors.Unknown.image
        }
    }
    
    var message: String {
        switch self {
        case .invalidRequest: return Strings.Errors.InvalidRequest.message
        case .invalidJSON: return Strings.Errors.InvalidJSON.message
        case .notConnected: return Strings.Errors.NotConnected.message
        case .unknown: return Strings.Errors.Unknown.message
        }
    }
}

// MARK: - Exchange Service
final class ExchangeService: ExchangeServicing {
    // MARK: - Public API
    func fetchAllExchanges(completion: @escaping APIResponse) {
        guard let requestUrl = URL(string: COINAPI_URL.appending("/v1/exchanges")) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let request = NSMutableURLRequest(url: requestUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 100)
        request.httpMethod = "GET"
        request.addValue(API_KEY, forHTTPHeaderField: HEADER_API_KEY)
        
        perform(request: request as URLRequest, completion: completion)
    }
}

// MARK: - Private Helpers
private extension ExchangeService {
    func perform(request _request: URLRequest, completion: @escaping APIResponse) {
        let session = URLSession(configuration: .default)
        let _ = session.dataTask(with: _request) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let _ = response as? HTTPURLResponse else {
                completion(.failure(.notConnected))
                return
            }
            
            guard let responseData = data else {
                completion(.failure(.unknown))
                return
            }
            
            do {
                let jsonResponse = try JSONDecoder().decode([ExchangeDTO].self, from: responseData)
                completion(.success(jsonResponse))
            } catch {
                completion(.failure(.invalidJSON))
            }
            
        }.resume()
    }
}
