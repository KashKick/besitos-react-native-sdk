# Besitos Offerwall SDK for Android

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)

Native Android SDK for launching the Besitos offerwall inside a managed `WebView`.

This folder is the Android package embedded in the React Native repository. For cross-platform usage, see the repo root [README](../../README.md).

## Features

- Kotlin API with `Offerwall.show(context, config)`
- Managed `Activity` and `WebView` lifecycle
- Safe parameter validation before launch
- Optional Combined route via `onlyOffers`
- Built-in loading and error states

## Requirements

- Android API 21+
- Internet permission

The SDK manifest already declares:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

## Installation

If you are consuming this folder as a Gradle module, add:

```kotlin
include(":app")
include(":besitos-android-sdk")
```

Then depend on it from your app module:

```kotlin
dependencies {
    implementation(project(":besitos-android-sdk"))
}
```

## Quick Start

```kotlin
import io.github.kashkick.besitos.android.sdk.offerwall.Offerwall
import io.github.kashkick.besitos.android.sdk.offerwall.config.OfferwallConfig

val config = OfferwallConfig(
    partnerId = "your_partner_id",
    userId = "user_123"
)

Offerwall.show(this, config)
```

Open the Combined route:

```kotlin
val config = OfferwallConfig(
    partnerId = "your_partner_id",
    userId = "user_123",
    onlyOffers = true
)
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
| `hideHeader` | `Boolean` | ❌ | Sends `hide_header=1` when `true` |
| `hideFooter` | `Boolean` | ❌ | Sends `hide_footer=1` when `true` |
| `onlyOffers` | `Boolean` | ❌ | Uses `/offers/{partnerId}` instead of `/v2/{partnerId}` |

## Route Behavior

- `onlyOffers = false` uses `https://wall.besitos.ai/v2/{partnerId}`
- `onlyOffers = true` uses `https://wall.besitos.ai/offers/{partnerId}`

## Validation

The SDK validates:

- `partnerId` must be non-blank and contain only letters, numbers, `_`, or `-`
- `userId` must be non-blank and contain only letters, numbers, `_`, or `-`
- `subId`, `deviceId`, `idfa`, and `gdfa` use the same character restrictions when provided

Invalid input throws `IllegalArgumentException`.

## License

MIT. See [LICENSE](../../LICENSE).
