# Besitos Offerwall SDK for iOS

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](../LICENSE)

Native iOS package for presenting the Besitos offerwall with a managed `WKWebView`.

This folder is the iOS package embedded in the React Native repository. For cross-platform usage, see the repo root [README](../README.md).

## Features

- Pure Swift implementation
- No third-party runtime dependencies
- Modal presentation from any `UIViewController`
- Optional Combined route via `onlyOffers`
- Built-in privacy manifest

## Requirements

- iOS 12+
- Swift 5.9+

## Installation

### Swift Package Manager

In Xcode, add:

```text
https://github.com/KashKick/besitos-react-native-sdk
```

Then select the `Offerwall` product.

### CocoaPods

```ruby
pod 'Offerwall', :git => 'https://github.com/KashKick/besitos-react-native-sdk.git', :branch => 'main'
```

Then run:

```bash
pod install
```

## Quick Start

```swift
import Offerwall

let config = OfferwallConfig(
    partnerId: "your_partner_id",
    userId: "user_123"
)

try? Offerwall.show(from: self, config: config)
```

Presentation note:

- Call `Offerwall.show(from:config:)` from a visible `UIViewController`.
- The SDK presents its own modal controller using `present(_:animated:)`.

Open the Combined route:

```swift
let config = OfferwallConfig(
    partnerId: "your_partner_id",
    userId: "user_123",
    onlyOffers: true
)
```

### SwiftUI

If you are using SwiftUI, obtain a presenting `UIViewController` from your scene or hosting hierarchy and call the same API:

```swift
import Offerwall
import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Open Offerwall") {
            guard
                let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let root = scene.windows.first?.rootViewController
            else { return }

            let config = OfferwallConfig(
                partnerId: "your_partner_id",
                userId: "user_123"
            )

            try? Offerwall.show(from: root, config: config)
        }
    }
}
```

## Configuration

| Field | Type | Required | Description |
| :---- | :--- | :------: | :---------- |
| `partnerId` | `String` | ✅ | Partner identifier used in the URL path |
| `userId` | `String` | ✅ | Unique user identifier |
| `subId` | `String?` | ❌ | Optional sub-publisher identifier |
| `deviceId` | `String?` | ❌ | Optional device identifier |
| `idfa` | `String?` | ❌ | Optional advertising identifier |
| `gdfa` | `String?` | ❌ | Optional Google advertising identifier |
| `info` | `String?` | ❌ | Optional custom metadata |
| `hideHeader` | `Bool` | ❌ | Sends `hide_header=1` when `true` |
| `hideFooter` | `Bool` | ❌ | Sends `hide_footer=1` when `true` |
| `onlyOffers` | `Bool` | ❌ | Uses `/offers/{partnerId}` instead of `/v2/{partnerId}` |

## Route Behavior

- `onlyOffers = false` uses `https://wall.besitos.ai/v2/{partnerId}`
- `onlyOffers = true` uses `https://wall.besitos.ai/offers/{partnerId}`

## Errors

The SDK can throw:

- `OfferwallError.invalidConfig(String)` when validation fails
- `OfferwallError.urlBuildFailed` when the final offerwall URL cannot be constructed

## Validation

The SDK validates:

- `partnerId` must be non-empty and contain only letters, numbers, `_`, or `-`
- `userId` must be non-empty and contain only letters, numbers, `_`, or `-`

Invalid input throws `OfferwallError.invalidConfig`.

## License

MIT. See [LICENSE](../LICENSE).
