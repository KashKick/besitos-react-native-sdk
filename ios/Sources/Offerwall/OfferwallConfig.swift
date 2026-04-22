import Foundation

public struct OfferwallConfig {
    public let partnerId: String
    public let userId: String
    public let subId: String?
    public let deviceId: String?
    public let idfa: String?
    public let gdfa: String?
    public let info: String?
    public let hideHeader: Bool
    public let hideFooter: Bool
    public let onlyOffers: Bool

    public init(
        partnerId: String,
        userId: String,
        subId: String? = nil,
        deviceId: String? = nil,
        idfa: String? = nil,
        gdfa: String? = nil,
        info: String? = nil,
        hideHeader: Bool = false,
        hideFooter: Bool = false,
        onlyOffers: Bool = false
    ) {
        self.partnerId = partnerId
        self.userId = userId
        self.subId = subId
        self.deviceId = deviceId
        self.idfa = idfa
        self.gdfa = gdfa
        self.info = info
        self.hideHeader = hideHeader
        self.hideFooter = hideFooter
        self.onlyOffers = onlyOffers
    }
}
