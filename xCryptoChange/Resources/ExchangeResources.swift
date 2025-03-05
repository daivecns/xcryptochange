import Foundation

public final class ExchangeResources {
    public static let resourcesBundle: Bundle = {
        guard let url = Bundle(for: ExchangeResources.self).url(forResource: "ExchangeResources", withExtension: "bundle") else {
            return Bundle(for: ExchangeResources.self)
        }

        return Bundle(url: url) ?? Bundle(for: ExchangeResources.self)
    }()
}
