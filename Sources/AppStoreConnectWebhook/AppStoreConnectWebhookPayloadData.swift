//
//  AppStoreConnectWebhookPayloadData.swift
//  AppStoreConnectWebhook
//
//  Created by treastrain on 2025/06/20.
//

import Foundation

public enum AppStoreConnectWebhookPayloadData: Sendable {
    case webhookPingCreated(WebhookPingCreated)
}

enum AppStoreConnectWebhookPayloadDataType: String, Codable, Sendable {
    case webhookPingCreated
}

extension AppStoreConnectWebhookPayloadData: Codable {
    enum CodingKeys: CodingKey {
        case type
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        guard container.allKeys.contains(.type) else {
            throw DecodingError.typeMismatch(
                AppStoreConnectWebhookPayloadData.self,
                DecodingError.Context.init(
                    codingPath: container.codingPath,
                    debugDescription: "Missing 'type' key in payload data.",
                    underlyingError: nil
                )
            )
        }
        let type = try container.decode(
            AppStoreConnectWebhookPayloadDataType.self,
            forKey: .type
        )
        switch type {
        case .webhookPingCreated:
            let webhookPingCreated = try WebhookPingCreated(from: decoder)
            self = .webhookPingCreated(webhookPingCreated)
        }
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .webhookPingCreated(let webhookPingCreated):
            try container.encode(
                AppStoreConnectWebhookPayloadDataType.webhookPingCreated,
                forKey: .type
            )
            try webhookPingCreated.encode(to: encoder)
        }
    }
}

extension AppStoreConnectWebhookPayloadData: CustomStringConvertible {
    public var description: String { logDescription }
}
