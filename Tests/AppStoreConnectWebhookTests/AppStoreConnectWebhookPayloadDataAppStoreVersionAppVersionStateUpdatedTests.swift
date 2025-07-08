//
//  AppStoreConnectWebhookPayloadDataAppStoreVersionAppVersionStateUpdatedTests.swift
//  AppStoreConnectWebhook
//
//  Created by treastrain on 2025/06/25.
//

import AppStoreConnectWebhook
import Foundation
import Testing

struct
    AppStoreConnectWebhookPayloadDataAppStoreVersionAppVersionStateUpdatedTests
{
    @Test
    func decode() throws {
        let payloadJSON = """
            {
                "data": {
                    "type": "appStoreVersionAppVersionStateUpdated",
                    "id": "01234567-abcd-8901-dcba-987654321012",
                    "version": 1,
                    "attributes": {
                        "newValue": "READY_FOR_REVIEW",
                        "oldValue": "PREPARE_FOR_SUBMISSION",
                        "timestamp": "2025-06-09T10:09:30.123Z"
                    },
                    "relationships": {
                        "instance": {
                            "data": {
                                "type": "appStoreVersions",
                                "id": "76543210-dcba-1098-abcd-210123456789"
                            },
                            "links": {
                                "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/76543210-dcba-1098-abcd-210123456789"
                            }
                        }
                    }
                }
            }
            """
        let payload = try AppStoreConnectWebhookPayload(json: payloadJSON)
        guard
            case .appStoreVersionAppVersionStateUpdated(
                let appStoreVersionAppVersionStateUpdated
            ) = payload.data
        else {
            Issue.record(
                "Expected payload data to be of type WebhookPingCreated, but got \(payload.data)"
            )
            return
        }

        #expect(
            appStoreVersionAppVersionStateUpdated.type
                == "appStoreVersionAppVersionStateUpdated"
        )
        #expect(
            appStoreVersionAppVersionStateUpdated.id
                == "01234567-abcd-8901-dcba-987654321012"
        )
        #expect(appStoreVersionAppVersionStateUpdated.version == 1)
        #expect(
            appStoreVersionAppVersionStateUpdated.attributes.newValue
                == .readyForReview
        )
        #expect(
            appStoreVersionAppVersionStateUpdated.attributes.oldValue
                == .prepareForSubmission
        )
        #expect(
            appStoreVersionAppVersionStateUpdated.attributes.timestamp
                == Date(timeIntervalSinceReferenceDate: 771156570.123)
        )
        #expect(
            appStoreVersionAppVersionStateUpdated.relationships.instance.data
                .type == "appStoreVersions"
        )
        #expect(
            appStoreVersionAppVersionStateUpdated.relationships.instance.data.id
                == "76543210-dcba-1098-abcd-210123456789"
        )
        #expect(
            appStoreVersionAppVersionStateUpdated.relationships.instance.links
                .`self`
                == URL(
                    string:
                        "https://api.appstoreconnect.apple.com/v1/appStoreVersions/76543210-dcba-1098-abcd-210123456789"
                )
        )
    }

    @Test
    func encode() throws {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601IncludingFractionalSeconds
        encoder.outputFormatting = [.sortedKeys]

        let payload = AppStoreConnectWebhookPayload(
            data: .appStoreVersionAppVersionStateUpdated(
                AppStoreConnectWebhookPayloadData
                    .AppStoreVersionAppVersionStateUpdated(
                        type: "appStoreVersionAppVersionStateUpdated",
                        id: "01234567-abcd-8901-dcba-987654321012",
                        version: 1,
                        attributes: .init(
                            newValue: .readyForReview,
                            oldValue: .prepareForSubmission,
                            timestamp: Date(
                                timeIntervalSinceReferenceDate: 771156570.123
                            )
                        ),
                        relationships: .init(
                            instance: .init(
                                data: .init(
                                    type: "appStoreVersions",
                                    id: "76543210-dcba-1098-abcd-210123456789"
                                ),
                                links: .init(
                                    _self: URL(
                                        string:
                                            "https://api.appstoreconnect.apple.com/v1/appStoreVersions/76543210-dcba-1098-abcd-210123456789"
                                    )!
                                )
                            )
                        )
                    )
            )
        )
        let payloadData = try encoder.encode(payload)
        let payloadJSON = String(data: payloadData, encoding: .utf8)!

        #expect(
            payloadJSON
                == #"{"data":{"attributes":{"newValue":"READY_FOR_REVIEW","oldValue":"PREPARE_FOR_SUBMISSION","timestamp":"2025-06-09T10:09:30.123Z"},"id":"01234567-abcd-8901-dcba-987654321012","relationships":{"instance":{"data":{"id":"76543210-dcba-1098-abcd-210123456789","type":"appStoreVersions"},"links":{"self":"https:\/\/api.appstoreconnect.apple.com\/v1\/appStoreVersions\/76543210-dcba-1098-abcd-210123456789"}}},"type":"appStoreVersionAppVersionStateUpdated","version":1}}"#
        )
    }
}
