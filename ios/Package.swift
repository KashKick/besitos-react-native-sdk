// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Offerwall",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Offerwall",
            targets: ["Offerwall"]
        ),
    ],
    targets: [
        .target(
            name: "Offerwall",
            path: "Sources/Offerwall",
            resources: [
                .copy("PrivacyInfo.xcprivacy")
            ]
        ),
    ]
)
