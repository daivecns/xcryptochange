import Foundation

// MARK: - DTO
public struct ExchangeDTO: Codable, Equatable {
    let exchangeID: String
    let website: String?
    let name: String?
    let dataQuoteStart: String?
    let dataQuoteEnd: String?
    let dataOrderbookStart: String?
    let dataOrderbookEnd: String?
    let dataTradeStart: String?
    let dataTradeEnd: String?
    let dataSymbolsCount: Int
    let volume1HrsUsd: Double
    let volume1DayUsd: Double
    let volume1MthUsd: Double
    let rank: Int
    
    enum CodingKeys: String, CodingKey {
        case exchangeID = "exchange_id"
        case website
        case name
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
        case rank
    }
}
 
// MARK: - Fixture
public extension ExchangeDTO {
    static func fixture (exchangeID: String = "exchangeID",
                         website: String? = "site",
                         name: String? = "name",
                         dataQuoteStart: String? = nil,
                         dataQuoteEnd: String? = nil,
                         dataOrderbookStart: String? = nil,
                         dataOrderbookEnd: String? = nil,
                         dataTradeStart: String? = nil,
                         dataTradeEnd: String? = nil,
                         dataSymbolsCount: Int = 0,
                         volume1HrsUsd: Double = 0.0,
                         volume1DayUsd: Double = 0.0,
                         volume1MthUsd: Double = 0.0,
                         rank: Int = 1) -> [ExchangeDTO] {
        [
            .init(exchangeID: exchangeID,
                  website: website,
                  name: name,
                  dataQuoteStart: dataQuoteStart,
                  dataQuoteEnd: dataQuoteEnd,
                  dataOrderbookStart: dataOrderbookStart,
                  dataOrderbookEnd: dataOrderbookEnd,
                  dataTradeStart: dataTradeStart,
                  dataTradeEnd: dataTradeEnd,
                  dataSymbolsCount: dataSymbolsCount,
                  volume1HrsUsd: volume1HrsUsd,
                  volume1DayUsd: volume1DayUsd,
                  volume1MthUsd: volume1MthUsd,
                  rank: rank)
        ]
    }
}
