//
//  AppStoreConnectWebhookPayloadDataWebhookPingCreated.swift
//  AppStoreConnectWebhook
//
//  Created by treastrain on 2025/06/20.
//

public import Foundation

extension AppStoreConnectWebhookPayloadData {
    public struct WebhookPingCreated: Codable, Sendable {
        public struct Attributes: Codable, Sendable {
            public let timestamp: Date

            public init(timestamp: Date) {
                self.timestamp = timestamp
            }
        }

        public let type: String
        public let id: String
        public let version: Int
        public let attributes: Attributes

        public init(
            type: String,
            id: String,
            version: Int,
            attributes: Attributes
        ) {
            self.type = type
            self.id = id
            self.version = version
            self.attributes = attributes
        }
    }
}

extension AppStoreConnectWebhookPayloadData.WebhookPingCreated:
    CustomStringConvertible
{
    public var description: String { logDescription }
}
