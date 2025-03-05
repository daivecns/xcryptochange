// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {

  internal enum Accessibility {
    internal enum ErrorView {
      internal enum Image {
        /// apiErrorImage
        internal static let identifier = Strings.tr("Localizable", "accessibility.errorView.image.identifier")
      }
      internal enum Message {
        /// apiErrorMessage
        internal static let identifier = Strings.tr("Localizable", "accessibility.errorView.message.identifier")
      }
    }
    internal enum ListView {
      internal enum TableView {
        /// exchangesList
        internal static let identifier = Strings.tr("Localizable", "accessibility.listView.tableView.identifier")
      }
    }
  }

  internal enum Details {
    /// Details
    internal static let title = Strings.tr("Localizable", "details.title")
    internal enum DailyVolume {
      /// Daily Volume (USD):
      internal static let caption = Strings.tr("Localizable", "details.dailyVolume.caption")
    }
    internal enum DataOrderbookEnd {
      /// Data Orderbook End:
      internal static let caption = Strings.tr("Localizable", "details.dataOrderbookEnd.caption")
    }
    internal enum DataOrderbookStart {
      /// Data Orderbook Start:
      internal static let caption = Strings.tr("Localizable", "details.dataOrderbookStart.caption")
    }
    internal enum DataQuoteEnd {
      /// Data Quote End:
      internal static let caption = Strings.tr("Localizable", "details.dataQuoteEnd.caption")
    }
    internal enum DataQuoteStart {
      /// Data Quote Start:
      internal static let caption = Strings.tr("Localizable", "details.dataQuoteStart.caption")
    }
    internal enum DataSymbolsCount {
      /// Data Symbols Qty:
      internal static let caption = Strings.tr("Localizable", "details.dataSymbolsCount.caption")
    }
    internal enum DataTradeEnd {
      /// Data Trade End:
      internal static let caption = Strings.tr("Localizable", "details.dataTradeEnd.caption")
    }
    internal enum DataTradeStart {
      /// Data Trade Start:
      internal static let caption = Strings.tr("Localizable", "details.dataTradeStart.caption")
    }
    internal enum ExchangeID {
      /// Exchange ID:
      internal static let caption = Strings.tr("Localizable", "details.exchangeID.caption")
    }
    internal enum ExchangeName {
      /// Exchange Name:
      internal static let caption = Strings.tr("Localizable", "details.exchangeName.caption")
    }
    internal enum ExchangeSite {
      /// Website:
      internal static let caption = Strings.tr("Localizable", "details.exchangeSite.caption")
    }
    internal enum HourlyVolume {
      /// Hourly Volume (USD):
      internal static let caption = Strings.tr("Localizable", "details.hourlyVolume.caption")
    }
    internal enum MonthlyVolume {
      /// Monthly Volume (USD):
      internal static let caption = Strings.tr("Localizable", "details.monthlyVolume.caption")
    }
    internal enum Rank {
      /// Rank:
      internal static let caption = Strings.tr("Localizable", "details.rank.caption")
    }
  }

  internal enum ErrorView {
    internal enum RetryButton {
      /// Tentar novamente
      internal static let caption = Strings.tr("Localizable", "errorView.retryButton.caption")
    }
  }

  internal enum Errors {
    internal enum InvalidJSON {
      /// text.page.slash
      internal static let image = Strings.tr("Localizable", "errors.invalidJSON.image")
      /// Ocorreu um erro ao processar os dados.
      /// O formato da resposta não é válido. Por favor, tente novamente mais tarde.
      internal static let message = Strings.tr("Localizable", "errors.invalidJSON.message")
    }
    internal enum InvalidRequest {
      /// exclamationmark.circle.fill
      internal static let image = Strings.tr("Localizable", "errors.invalidRequest.image")
      /// A solicitação não pôde ser processada.
      /// Verifique os dados enviados e tente novamente.
      internal static let message = Strings.tr("Localizable", "errors.invalidRequest.message")
    }
    internal enum NotConnected {
      /// wifi.slash
      internal static let image = Strings.tr("Localizable", "errors.notConnected.image")
      /// Parece que você está offline.
      /// Verifique sua conexão com a internet e tente novamente.
      internal static let message = Strings.tr("Localizable", "errors.notConnected.message")
    }
    internal enum Unknown {
      /// wifi.exclamationmark
      internal static let image = Strings.tr("Localizable", "errors.unknown.image")
      /// Ocorreu um erro inesperado.
      /// Por favor, tente novamente.
      internal static let message = Strings.tr("Localizable", "errors.unknown.message")
    }
  }

  internal enum ExchangeCell {
    /// exchangeCell
    internal static let identifier = Strings.tr("Localizable", "exchangeCell.identifier")
    internal enum DailyVolume {
      /// Daily Volume (USD):
      internal static let caption = Strings.tr("Localizable", "exchangeCell.dailyVolume.caption")
    }
    internal enum ExchangeID {
      /// Exchange ID:
      internal static let caption = Strings.tr("Localizable", "exchangeCell.exchangeID.caption")
    }
    internal enum ExchangeName {
      /// Exchange Name:
      internal static let caption = Strings.tr("Localizable", "exchangeCell.exchangeName.caption")
    }
    internal enum ExchangeSite {
      /// Website:
      internal static let caption = Strings.tr("Localizable", "exchangeCell.exchangeSite.caption")
    }
  }

  internal enum Main {
    /// xCryptoChange
    internal static let title = Strings.tr("Localizable", "main.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
