import Foundation
import xCryptoChange

final class LocalMock<T: Decodable> {
    init() { }

    func from(file fileName: ExchangeLocalMockFile) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let bundle = ExchangeResources.resourcesBundle
        let path = bundle.path(forResource: fileName.rawValue, ofType: "json") ?? ""
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        let object = try decoder.decode(T.self, from: data)
        return object
    }
}

// MARK: - Mocked Files Identifiers
enum ExchangeLocalMockFile: String {
    case exchangesDTOResults = "exchanges_dto_results"
}
