# AppStoreConnectWebhook
Type definitions for App Store Connect webhook notification payloads in Swift.

[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/treastrain/AppStoreConnectWebhook/blob/main/LICENSE)
![Platform: macOS|Linux|Windows](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux%20%7C%20Windows-lightgrey.svg)
![Swift: 6.1](https://img.shields.io/badge/Swift-6.1-orange.svg)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/swiftlang/swift-package-manager) \
[![X (formerly Twitter): @treastrain](https://img.shields.io/twitter/follow/treastrain?label=%40treastrain&style=social)](https://x.com/treastrain)
[![Swift Build & Test](https://github.com/treastrain/AppStoreConnectWebhook/actions/workflows/swift.yml/badge.svg)](https://github.com/treastrain/AppStoreConnectWebhook/actions/workflows/swift.yml)

# Usage
```swift
import AppStoreConnectWebhook
import Foundation

let payloadJSON = """
    {
        "data": {
            "type": "webhookPingCreated",
            "id": "01234567-abcd-8901-dcba-987654321012",
            "version": 1,
            "attributes": {
                "timestamp": "2025-06-09T10:09:30.123456789Z"
            }
        }
    }
    """

let payload = try AppStoreConnectWebhookPayload(json: payloadJSON)
switch payload.data {
case .webhookPingCreated(let webhookPingCreated):
    webhookPingCreated.id  // "01234567-abcd-8901-dcba-987654321012"
    webhookPingCreated.attributes.timestamp  // 2025-06-09T10:09:30.123Z
// ...
}
```

# How to add to your project
## Package dependencies
```swift
.package(url: "https://github.com/treastrain/AppStoreConnectWebhook", branch: "main"),
```

## Target dependencies
```swift
.product(name: "AppStoreConnectWebhook", package: "AppStoreConnectWebhook"),
```

# License
MIT
