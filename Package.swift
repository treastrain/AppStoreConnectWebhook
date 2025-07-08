// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "AppStoreConnectWebhook",
    platforms: [
        .iOS(.v15),
        .macCatalyst(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .visionOS(.v1),
        .watchOS(.v8),
    ],
    products: [
        .library(
            name: "AppStoreConnectWebhook",
            targets: ["AppStoreConnectWebhook"]
        )
    ],
    targets: [
        .target(
            name: "AppStoreConnectWebhook"
        ),
        .testTarget(
            name: "AppStoreConnectWebhookTests",
            dependencies: ["AppStoreConnectWebhook"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

// Ref: https://github.com/treastrain/swift-upcomingfeatureflags-cheatsheet

extension SwiftSetting {
    static let existentialAny: Self = .enableUpcomingFeature("ExistentialAny")                      // SE-0335, Swift 5.6,  SwiftPM 5.8+
    static let internalImportsByDefault: Self = .enableUpcomingFeature("InternalImportsByDefault")  // SE-0409, Swift 6.0,  SwiftPM 6.0+
    static let memberImportVisibility: Self = .enableUpcomingFeature("MemberImportVisibility")      // SE-0444, Swift 6.1,  SwiftPM 6.1+
}

extension SwiftSetting: @retroactive CaseIterable {
    public static var allCases: [Self] {
        [.existentialAny, .internalImportsByDefault, .memberImportVisibility]
    }
}

package.targets
    .forEach { $0.swiftSettings = SwiftSetting.allCases }
