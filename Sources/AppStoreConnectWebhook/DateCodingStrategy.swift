//
//  DateCodingStrategy.swift
//  AppStoreConnectWebhook
//
//  Created by treastrain on 2025/06/20.
//

public import Foundation

private let style = Date.ISO8601FormatStyle()
    .year()
    .month()
    .day()
    .timeZone(separator: .omitted)
    .time(includingFractionalSeconds: true)
    .timeSeparator(.colon)

extension JSONDecoder.DateDecodingStrategy {
    public static var iso8601IncludingFractionalSeconds: Self {
        .custom {
            try style.parse(
                $0.singleValueContainer()
                    .decode(String.self)
            )
        }
    }
}

extension JSONEncoder.DateEncodingStrategy {
    public static var iso8601IncludingFractionalSeconds: Self {
        .custom {
            var container = $1.singleValueContainer()
            try container.encode(style.format($0))
        }
    }
}
