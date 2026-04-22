# Besitos Offerwall SDK

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)

Cross-platform SDK for launching the Besitos offerwall from Android, iOS, and React Native applications.

## Features

- Native Android and iOS SDKs in the same repo
- React Native bridge with a single `Offerwall.show(...)` API
- Safe parameter validation before launch
- Optional Combined route via `onlyOffers`
- Native WebView-based presentation on both platforms

## Requirements

- Android API 21+
- iOS 12+
- React Native 0.73+

## Installation

### React Native package

```bash
npm install besitos-react-native-sdk-offerwall
```

### Android native SDK

Ensure `mavenCentral()` is available:

```kotlin
dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}
```

Add the Android dependency:

```kotlin
dependencies {
    implementation("io.github.kashkick:besitos-android-sdk:1.0.0")
}
```

### iOS native SDK

Swift Package Manager:

```text
https://github.com/KashKick/besitos-react-native-sdk
```

CocoaPods:

```ruby
pod 'Offerwall', :git => 'https://github.com/KashKick/besitos-react-native-sdk.git', :branch => 'main'
```

## Quick Start

### React Native

```tsx
import { Offerwall } from "besitos-react-native-sdk-offerwall";

Offerwall.show({
  partnerId: "your_partner_id",
  userId: "user_123",
});
```

Open the Combined route:

```tsx
Offerwall.show({
  partnerId: "your_partner_id",
  userId: "user_123",
  onlyOffers: true,
});
```

### Android

```kotlin
import io.github.kashkick.besitos.android.sdk.offerwall.Offerwall
import io.github.kashkick.besitos.android.sdk.offerwall.config.OfferwallConfig

val config = OfferwallConfig(
    partnerId = "your_partner_id",
    userId = "user_123"
)

Offerwall.show(context = this, config = config)
```

### iOS

```swift
import Offerwall

let config = OfferwallConfig(
    partnerId: "your_partner_id",
    userId: "user_123"
)

try? Offerwall.show(from: self, config: config)
```

## Configuration

The shared config shape is:

| Parameter | Type | Required | Description |
| :--- | :--- | :---: | :--- |
| `partnerId` | `string` | ✅ | Partner identifier used in the URL path |
| `userId` | `string` | ✅ | Unique ID for the current user |
| `subId` | `string` | ❌ | Optional sub-publisher identifier |
| `deviceId` | `string` | ❌ | Optional device identifier |
| `idfa` | `string` | ❌ | Optional advertising identifier |
| `gdfa` | `string` | ❌ | Optional Google advertising identifier |
| `info` | `string` | ❌ | Optional custom metadata |
| `hideHeader` | `boolean` | ❌ | Sends `hide_header=1` when `true` |
| `hideFooter` | `boolean` | ❌ | Sends `hide_footer=1` when `true` |
| `onlyOffers` | `boolean` | ❌ | Uses the Combined route instead of the default route |

## Route Behavior

The SDK builds one of these routes:

- Default route: `https://wall.besitos.ai/v2/{partnerId}?...`
- Combined route: `https://wall.besitos.ai/offers/{partnerId}?...`

`onlyOffers = true` switches to the Combined route.

## Validation

The SDK validates:

- `partnerId` must be non-empty and contain only letters, numbers, `_`, or `-`
- `userId` must be non-empty and contain only letters, numbers, `_`, or `-`
- `subId`, `deviceId`, `idfa`, and `gdfa` use the same character restrictions when provided

React Native throws `Error` for invalid config before crossing the native bridge.

## Platform Notes

- Android requires internet permission. The Android SDK manifest already declares it.
- iOS package docs are available in [ios/README.md](ios/README.md).
- Android core SDK notes are available in [android/besitos-android-sdk/README.md](android/besitos-android-sdk/README.md).

## License

MIT. See [LICENSE](LICENSE).
