import Foundation

struct UrlBuilder {

    static func build(config: OfferwallConfig) -> URL? {
        let urlPath = config.onlyOffers ? "offers" : "v2"
        var components = URLComponents(string: "\(SdkConfig.baseUrl)/\(urlPath)/\(encode(config.partnerId))")
        var items: [URLQueryItem] = []

        items.append(URLQueryItem(name: "userid", value: config.userId))

        if let subId = config.subId, !subId.isEmpty {
            items.append(URLQueryItem(name: "subid", value: subId))
        }
        if let deviceId = config.deviceId, !deviceId.isEmpty {
            items.append(URLQueryItem(name: "device_id", value: deviceId))
        }
        if let idfa = config.idfa, !idfa.isEmpty {
            items.append(URLQueryItem(name: "idfa", value: idfa))
        }
        if let gdfa = config.gdfa, !gdfa.isEmpty {
            items.append(URLQueryItem(name: "gdfa", value: gdfa))
        }
        if let info = config.info, !info.isEmpty {
            items.append(URLQueryItem(name: "info", value: info))
        }
        items.append(URLQueryItem(name: "hide_header", value: config.hideHeader ? "1" : "0"))
        items.append(URLQueryItem(name: "hide_footer", value: config.hideFooter ? "1" : "0") )

        components?.queryItems = items
        return components?.url
    }

    private static func encode(_ value: String) -> String {
        value.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? value
    }
}
