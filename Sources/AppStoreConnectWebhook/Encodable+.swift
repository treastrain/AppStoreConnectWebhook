//
//  Encodable+.swift
//  AppStoreConnectWebhook
//
//  Created by treastrain on 2025/06/20.
//

import Foundation

private let logDescriptionEncoder = {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [
        .prettyPrinted,
        .sortedKeys,
        .withoutEscapingSlashes,
    ]
    encoder.dateEncodingStrategy = .iso8601IncludingFractionalSeconds
    return encoder
}()

extension Encodable {
    var logDescription: String {
        let data = try! logDescriptionEncoder.encode(self)
        return String(data: data, encoding: .utf8)!
    }
}
