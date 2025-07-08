//
//  AppStoreConnectWebhookPayloadDataAppStoreVersionAppVersionStateUpdated.swift
//  AppStoreConnectWebhook
//
//  Created by treastrain on 2025/06/25.
//

public import Foundation

extension AppStoreConnectWebhookPayloadData {
    public struct AppStoreVersionAppVersionStateUpdated: Codable, Sendable {
        public struct Attributes: Codable, Sendable {
            public let newValue: Value
            public let oldValue: Value
            public let timestamp: Date

            public init(newValue: Value, oldValue: Value, timestamp: Date) {
                self.newValue = newValue
                self.oldValue = oldValue
                self.timestamp = timestamp
            }
        }
        public struct Relationships: Codable, Sendable {
            public struct Instance: Codable, Sendable {
                public struct Data: Codable, Sendable {
                    public let type: String
                    public let id: String

                    public init(type: String, id: String) {
                        self.type = type
                        self.id = id
                    }
                }

                public struct Links: Codable, Sendable {
                    public let `self`: URL

                    public init(_self: URL) {
                        self.`self` = _self
                    }
                }

                public let data: Data
                public let links: Links

                public init(data: Data, links: Links) {
                    self.data = data
                    self.links = links
                }
            }

            public let instance: Instance

            public init(instance: Instance) {
                self.instance = instance
            }
        }

        public let type: String
        public let id: String
        public let version: Int
        public let attributes: Attributes
        public let relationships: Relationships

        public init(
            type: String,
            id: String,
            version: Int,
            attributes: Attributes,
            relationships: Relationships
        ) {
            self.type = type
            self.id = id
            self.version = version
            self.attributes = attributes
            self.relationships = relationships
        }
    }
}

extension AppStoreConnectWebhookPayloadData
    .AppStoreVersionAppVersionStateUpdated: CustomStringConvertible
{
    public var description: String { logDescription }
}
