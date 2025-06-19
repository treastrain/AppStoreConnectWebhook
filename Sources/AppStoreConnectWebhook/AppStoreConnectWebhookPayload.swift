//
//  AppStoreConnectWebhookPayload.swift
//  AppStoreConnectWebhook
//
//  Created by treastrain on 2025/06/20.
//

public import Foundation

public struct AppStoreConnectWebhookPayload: Codable, Sendable {
    public let data: AppStoreConnectWebhookPayloadData

    public init(data: AppStoreConnectWebhookPayloadData) {
        self.data = data
    }
}

extension AppStoreConnectWebhookPayload {
    public init(json: String, using encoding: String.Encoding = .utf8) throws {
        let data = json.data(using: encoding)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601IncludingFractionalSeconds
        self = try decoder.decode(Self.self, from: data)
    }
}

extension AppStoreConnectWebhookPayload: CustomStringConvertible {
    public var description: String { logDescription }
}
