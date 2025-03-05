import Foundation

// MARK: - Exchange View Model
struct ExchangeViewModel: Equatable {
    let exchangeID: String
    let name: String
    let site: String
    let dataQuoteStart: String
    let dataQuoteEnd: String
    let orderBookDataStart: String
    let orderBookDataEnd: String
    let dataTradeStart: String
    let dataTradeEnd: String
    let dataSymbolsQty: String
    let hourlyVolumeUSD: String
    let dailyVolumeUSD: String
    let monthlyVolumeUSD: String
    let rank: String
}

// MARK: - Initializers
extension ExchangeViewModel {
    init(dto: ExchangeDTO) {
        self.init(exchangeID: dto.exchangeID,
                  name: dto.name ?? "",
                  site: dto.website ?? "",
                  dataQuoteStart: dto.dataQuoteStart.toFormattedDate(),
                  dataQuoteEnd: dto.dataQuoteEnd.toFormattedDate(),
                  orderBookDataStart: dto.dataQuoteStart.toFormattedDate(),
                  orderBookDataEnd: dto.dataQuoteEnd.toFormattedDate(),
                  dataTradeStart: dto.dataTradeStart.toFormattedDate(),
                  dataTradeEnd: dto.dataTradeEnd.toFormattedDate(),
                  dataSymbolsQty: String(dto.dataSymbolsCount),
                  hourlyVolumeUSD: dto.volume1HrsUsd.formatted(.currency(code: "USD")),
                  dailyVolumeUSD: dto.volume1DayUsd.formatted(.currency(code: "USD")),
                  monthlyVolumeUSD: dto.volume1MthUsd.formatted(.currency(code: "USD")),
                  rank: String(dto.rank)
        )
    }
}

// MARK: - Fixture
extension ExchangeViewModel {
    static func fixture(exchangeID: String = "exchangeID",
                        name: String = "name",
                        site: String = "site",
                        dataQuoteStart: String = "",
                        dataQuoteEnd: String = "",
                        orderBookDataStart: String = "",
                        orderBookDataEnd: String = "",
                        dataTradeStart: String = "",
                        dataTradeEnd: String = "",
                        dataSymbolsQty: String = String(0),
                        hourlyVolumeUSD: String = 0.formatted(.currency(code: "USD")),
                        dailyVolumeUSD: String = 0.formatted(.currency(code: "USD")),
                        monthlyVolumeUSD: String = 0.formatted(.currency(code: "USD")),
                        rank: String = String(1)) -> ExchangeViewModel {
        .init(exchangeID: exchangeID,
              name: name,
              site: site,
              dataQuoteStart: dataQuoteStart,
              dataQuoteEnd: dataQuoteEnd,
              orderBookDataStart: orderBookDataStart,
              orderBookDataEnd: orderBookDataEnd,
              dataTradeStart: dataTradeStart,
              dataTradeEnd: dataTradeEnd,
              dataSymbolsQty: dataSymbolsQty,
              hourlyVolumeUSD: hourlyVolumeUSD,
              dailyVolumeUSD: dailyVolumeUSD,
              monthlyVolumeUSD: monthlyVolumeUSD,
              rank: rank)
    }
}

// MARK: - Private Helpers
private extension String? {
    func toFormattedDate() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        guard let self, let date = formatter.date(from: self) else { return "" }
        return date.formatted(date: .numeric, time: .omitted)
    }
}
