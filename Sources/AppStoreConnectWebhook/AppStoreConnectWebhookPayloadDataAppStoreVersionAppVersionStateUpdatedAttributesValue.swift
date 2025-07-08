//
//  AppStoreConnectWebhookPayloadDataAppStoreVersionAppVersionStateUpdatedAttributesValue.swift
//  AppStoreConnectWebhook
//
//  Created by treastrain on 2025/06/25.
//

public import Foundation

extension AppStoreConnectWebhookPayloadData
    .AppStoreVersionAppVersionStateUpdated.Attributes
{
    public enum Value: String, Codable, CaseIterable, Sendable {
        case accepted = "ACCEPTED"
        case developerRejected = "DEVELOPER_REJECTED"
        case developerRemovedFromSale = "DEVELOPER_REMOVED_FROM_SALE"
        case invalidBinary = "INVALID_BINARY"
        case inReview = "IN_REVIEW"
        case metadataRejected = "METADATA_REJECTED"
        case missingScreenshot = "MISING_SCREENSHOT"
        case notApplicable = "NOT_APPLICABLE"
        case pendingAppleRelease = "PENDING_APPLE_RELEASE"
        case pendingContract = "PENDING_CONTRACT"
        case pendingDeveloperRelease = "PENDING_DEVELOPER_RELEASE"
        case preorderReadyForDistribution = "PREORDER_READY_FOR_DISTRIBUTION"
        case preorderReadyForSale = "PREORDER_READY_FOR_SALE"
        case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
        case processingForAppStore = "PROCESSING_FOR_APP_STORE"
        case processingForDistribution = "PROCESSING_FOR_DISTRIBUTION"
        case readyForDistribution = "READY_FOR_DISTRIBUTION"
        case readyForReview = "READY_FOR_REVIEW"
        case readyForSale = "READY_FOR_SALE"
        case rejected = "REJECTED"
        case removedFromSale = "REMOVED_FROM_SALE"
        case replacedWithNewVersion = "REPLACED_WITH_NEW_VERSION"
        case uploadReceived = "UPLOAD_RECEIVED"
        case waitingForExportCompliance = "WAITING_FOR_EXPORT_COMPLIANCE"
        case waitingForReview = "WAITING_FOR_REVIEW"
        case waitingForUpload = "WAITING_FOR_UPLOAD"
    }
}

extension AppStoreConnectWebhookPayloadData
    .AppStoreVersionAppVersionStateUpdated.Attributes.Value
{
    public func formatted() -> String {
        formatted(.appStoreVersionAppVersionStateUpdatedAttributesValue)
    }

    public func formatted(locale: Locale) -> String {
        formatted(
            .appStoreVersionAppVersionStateUpdatedAttributesValue.locale(locale)
        )
    }

    public func formatted<
        F: Foundation.FormatStyle
    >(_ format: F) -> F.FormatOutput
    where
        F.FormatInput == AppStoreConnectWebhookPayloadData
            .AppStoreVersionAppVersionStateUpdated.Attributes.Value
    {
        format.format(self)
    }
}

extension AppStoreConnectWebhookPayloadData
    .AppStoreVersionAppVersionStateUpdated.Attributes.Value
{
    public struct FormatStyle: Foundation.FormatStyle {
        public var locale: Locale
        let formatter: Formatter

        public init(locale: Locale = .autoupdatingCurrent) {
            self.locale = locale
            self.formatter = Formatter()
        }

        public func format(
            _ value: AppStoreConnectWebhookPayloadData
                .AppStoreVersionAppVersionStateUpdated.Attributes.Value
        ) -> String {
            formatter.string(from: value, locale: locale)
        }

        public func locale(_ locale: Locale) -> Self {
            var new = self
            new.locale = locale
            return new
        }
    }
}

extension Foundation.FormatStyle
where
    Self == AppStoreConnectWebhookPayloadData
        .AppStoreVersionAppVersionStateUpdated.Attributes.Value.FormatStyle
{
    public static var appStoreVersionAppVersionStateUpdatedAttributesValue: Self
    {
        Self()
    }
}
