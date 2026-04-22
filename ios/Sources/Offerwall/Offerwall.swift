import UIKit

public enum OfferwallError: Error {
    case invalidConfig(String)
    case urlBuildFailed
}

public class Offerwall {

    public static func show(from viewController: UIViewController, config: OfferwallConfig) throws {
        switch ValidationUtil.validate(config) {
        case .invalid(let reason):
            throw OfferwallError.invalidConfig(reason)
        case .valid:
            break
        }

        guard let url = UrlBuilder.build(config: config) else {
            throw OfferwallError.urlBuildFailed
        }

        let offerwallVC = OfferwallViewController(url: url)
        viewController.present(offerwallVC, animated: true)
    }
}
