import Foundation
import xCryptoChange

enum ExchangeViewModelMockFactory {
    static func make(file: ExchangeLocalMockFile = .exchangesDTOResults) -> [ExchangeDTO] {
        do {
            return try LocalMock<[ExchangeDTO]>().from(file: file)
        } catch {
            return []
        }
    }
}
