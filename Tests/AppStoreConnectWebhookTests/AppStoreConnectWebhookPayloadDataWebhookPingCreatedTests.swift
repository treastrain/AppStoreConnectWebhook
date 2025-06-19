//
//  AppStoreConnectWebhookPayloadDataWebhookPingCreatedTests.swift
//  AppStoreConnectWebhook
//
//  Created by treastrain on 2025/06/20.
//

import AppStoreConnectWebhook
import Foundation
import Testing

struct AppStoreConnectWebhookPayloadDataWebhookPingCreatedTests {
    @Test
    func decode() throws {
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
        guard case .webhookPingCreated(let webhookPingCreated) = payload.data
        else {
            Issue.record(
                "Expected payload data to be of type WebhookPingCreated, but got \(payload.data)"
            )
            return
        }

        #expect(webhookPingCreated.type == "webhookPingCreated")
        #expect(webhookPingCreated.id == "01234567-abcd-8901-dcba-987654321012")
        #expect(webhookPingCreated.version == 1)
        #expect(
            webhookPingCreated.attributes.timestamp
                == Date(timeIntervalSinceReferenceDate: 771156570.123456789)
        )
    }

    @Test
    func encode() throws {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601IncludingFractionalSeconds
        encoder.outputFormatting = [.sortedKeys]

        let payload = AppStoreConnectWebhookPayload(
            data: .webhookPingCreated(
                AppStoreConnectWebhookPayloadData.WebhookPingCreated(
                    type: "webhookPingCreated",
                    id: "01234567-abcd-8901-dcba-987654321012",
                    version: 1,
                    attributes: .init(
                        timestamp: Date(
                            timeIntervalSinceReferenceDate: 771156570.123456789
                        )
                    )
                )
            )
        )
        let payloadData = try encoder.encode(payload)
        let payloadJSON = String(data: payloadData, encoding: .utf8)!

        #expect(
            payloadJSON
                == #"{"data":{"attributes":{"timestamp":"2025-06-09T10:09:30.123Z"},"id":"01234567-abcd-8901-dcba-987654321012","type":"webhookPingCreated","version":1}}"#
        )
    }
}
