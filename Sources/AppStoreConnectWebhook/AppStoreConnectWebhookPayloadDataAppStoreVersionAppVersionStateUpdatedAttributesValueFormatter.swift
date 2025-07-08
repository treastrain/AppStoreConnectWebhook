//
//  AppStoreConnectWebhookPayloadDataAppStoreVersionAppVersionStateUpdatedAttributesValueFormatter.swift
//  AppStoreConnectWebhook
//
//  Created by treastrain on 2025/06/25.
//

import Foundation

extension AppStoreConnectWebhookPayloadData
    .AppStoreVersionAppVersionStateUpdated.Attributes.Value
{
    struct Formatter: Codable, Hashable, Sendable {
        func string(
            from value: AppStoreConnectWebhookPayloadData
                .AppStoreVersionAppVersionStateUpdated.Attributes.Value,
            locale: Locale
        ) -> String {
            let keyPath:
                KeyPath<
                    AppStoreConnectWebhookPayloadData
                        .AppStoreVersionAppVersionStateUpdated.Attributes.Value
                        .Formatted,
                    String
                > =
                    if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0,
                    *) {
                        switch locale.language.languageCode {
                        case .japanese: \.ja
                        case .english: \.en
                        default: \.en
                        }
                    } else {
                        switch locale.languageCode {
                        case "ja": \.ja
                        case "en": \.en
                        default: \.en
                        }
                    }
            return value.formattedValue[keyPath: keyPath]
        }
    }
}

extension AppStoreConnectWebhookPayloadData
    .AppStoreVersionAppVersionStateUpdated.Attributes.Value
{
    fileprivate struct Formatted {
        let en: String
        let ja: String
    }

    private var formattedValue: Formatted {
        switch self {
        case .accepted:
            Formatted(en: "Accepted", ja: "承認済み")
        case .developerRejected:
            Formatted(en: "Developer Rejected", ja: "デベロッパにより却下済み")
        case .developerRemovedFromSale:
            Formatted(
                en: "Developer Removed from Sale",
                ja: "デベロッパによりストアから削除済み"
            )
        case .invalidBinary:
            Formatted(en: "Invalid Binary", ja: "バイナリが無効")
        case .inReview:
            Formatted(en: "In Review", ja: "審査中")
        case .metadataRejected:
            Formatted(en: "Metadata Rejected", ja: "メタデータ却下済み")
        case .missingScreenshot:
            Formatted(en: "Missing Screenshot", ja: "スクリーンショットなし")
        case .notApplicable:
            Formatted(en: "Not Applicable", ja: "該当なし")
        case .pendingAppleRelease:
            Formatted(en: "Pending Apple Release", ja: "Apple がリリースを保留中")
        case .pendingContract:
            Formatted(en: "Pending Agreement", ja: "契約保留中")
        case .pendingDeveloperRelease:
            Formatted(en: "Pending Developer Release", ja: "デベロッパによるリリース待ち")
        case .preorderReadyForDistribution:
            Formatted(en: "Pre-Order Ready for Distribution", ja: "予約注文の配布準備完了")
        case .preorderReadyForSale:
            Formatted(en: "Pre-Order Ready for Sale", ja: "予約注文の配信準備完了")
        case .prepareForSubmission:
            Formatted(en: "Prepare for Submission", ja: "提出準備中")
        case .processingForAppStore:
            Formatted(en: "Processing for App Store", ja: "App Store への処理中")
        case .processingForDistribution:
            Formatted(en: "Processing for Distribution", ja: "配布への処理中")
        case .readyForDistribution:
            Formatted(en: "Ready for Distribution", ja: "配布準備完了")
        case .readyForReview:
            Formatted(en: "Ready for Review", ja: "審査準備完了")
        case .readyForSale:
            Formatted(en: "Ready for Sale", ja: "配信準備完了")
        case .rejected:
            Formatted(en: "Rejected", ja: "却下済み")
        case .removedFromSale:
            Formatted(en: "Removed from Sale", ja: "ストアから削除済み")
        case .replacedWithNewVersion:
            Formatted(en: "Replaced", ja: "置き換え済み")
        case .uploadReceived:
            Formatted(en: "Upload Received", ja: "アップロード受信済み")
        case .waitingForExportCompliance:
            Formatted(en: "Waiting for Export Compliance", ja: "輸出コンプライアンス待ち")
        case .waitingForReview:
            Formatted(en: "Waiting for Review", ja: "審査待ち")
        case .waitingForUpload:
            Formatted(en: "Waiting for Upload", ja: "アップロードを待機中")
        }
    }
}
