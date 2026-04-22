import Foundation
import UIKit

class OfferwallViewModel: ObservableObject {
    @Published var partnerId: String = "CwI606dZ"
    @Published var userId: String = "user_123"
    @Published var subId: String = "ios_test"
    @Published var deviceId: String = UIDevice.current.identifierForVendor?.uuidString ?? ""
    @Published var info: String = ""
    @Published var hideHeader: Bool = true
    @Published var hideFooter: Bool = true
    @Published var onlyOffers: Bool = false
    
    @Published var errorMessage: String? = nil
    @Published var showErrorAlert: Bool = false
    
    func launchOfferwall(from viewController: UIViewController) {
        let config = OfferwallConfig(
            partnerId: partnerId,
            userId: userId,
            subId: subId.isEmpty ? nil : subId,
            deviceId: deviceId.isEmpty ? nil : deviceId,
            idfa: nil, // Add logic if tracking permission is granted
            gdfa: nil,
            info: info.isEmpty ? nil : info,
            hideHeader: hideHeader,
            hideFooter: hideFooter,
            onlyOffers: onlyOffers
        )
        
        do {
            try Offerwall.show(from: viewController, config: config)
        } catch {
            self.errorMessage = error.localizedDescription
            self.showErrorAlert = true
        }
    }
}
