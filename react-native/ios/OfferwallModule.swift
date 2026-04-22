import Foundation
import Offerwall

@objc(Offerwall)
class OfferwallModule: NSObject {

    @objc
    func show(_ options: NSDictionary) {
        guard
            let partnerId = options["partnerId"] as? String,
            let userId = options["userId"] as? String
        else { return }

        let config = OfferwallConfig(
            partnerId: partnerId,
            userId: userId,
            subId: options["subId"] as? String,
            deviceId: options["deviceId"] as? String,
            idfa: options["idfa"] as? String,
            gdfa: options["gdfa"] as? String,
            info: options["info"] as? String,
            hideHeader: options["hideHeader"] as? Bool ?? false,
            hideFooter: options["hideFooter"] as? Bool ?? false,
            onlyOffers: options["onlyOffers"] as? Bool ?? false
        )

        DispatchQueue.main.async {
            guard let root = UIApplication.shared.windows.first?.rootViewController else { return }
            try? Offerwall.show(from: root, config: config)
        }
    }

    @objc
    static func requiresMainQueueSetup() -> Bool { false }
}
