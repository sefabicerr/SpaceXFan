//
//  Upcoming.swift
//  SpaceXFan
//
//  Created by Muhammed Sefa Biçer on 25.05.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
class Upcoming: Codable {
    let fairings: Fairings?
    let links: Links
    let staticFireDateUTC, staticFireDateUnix: JSONNull?
    let net: Bool
    let window: JSONNull?
    let rocket: Rockett
    let success: JSONNull?
    let failures: [JSONAny]
    let details: JSONNull?
    let crew, ships, capsules: [JSONAny]
    let payloads: [String]
    let launchpad: Launchpad
    let flightNumber: Int
    let name, dateUTC: String
    let dateUnix: Int
    let dateLocal: Date
    let datePrecision: String
    let upcoming: Bool
    let cores: [Core]
    let autoUpdate, tbd: Bool
    let launchLibraryID: String?
    let id: String

    enum CodingKeys: String, CodingKey {
        case fairings, links
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case net, window, rocket, success, failures, details, crew, ships, capsules, payloads, launchpad
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming, cores
        case autoUpdate = "auto_update"
        case tbd
        case launchLibraryID = "launch_library_id"
        case id
    }

    init(fairings: Fairings?, links: Links, staticFireDateUTC: JSONNull?, staticFireDateUnix: JSONNull?, net: Bool, window: JSONNull?, rocket: Rockett, success: JSONNull?, failures: [JSONAny], details: JSONNull?, crew: [JSONAny], ships: [JSONAny], capsules: [JSONAny], payloads: [String], launchpad: Launchpad, flightNumber: Int, name: String, dateUTC: String, dateUnix: Int, dateLocal: Date, datePrecision: String, upcoming: Bool, cores: [Core], autoUpdate: Bool, tbd: Bool, launchLibraryID: String?, id: String) {
        self.fairings = fairings
        self.links = links
        self.staticFireDateUTC = staticFireDateUTC
        self.staticFireDateUnix = staticFireDateUnix
        self.net = net
        self.window = window
        self.rocket = rocket
        self.success = success
        self.failures = failures
        self.details = details
        self.crew = crew
        self.ships = ships
        self.capsules = capsules
        self.payloads = payloads
        self.launchpad = launchpad
        self.flightNumber = flightNumber
        self.name = name
        self.dateUTC = dateUTC
        self.dateUnix = dateUnix
        self.dateLocal = dateLocal
        self.datePrecision = datePrecision
        self.upcoming = upcoming
        self.cores = cores
        self.autoUpdate = autoUpdate
        self.tbd = tbd
        self.launchLibraryID = launchLibraryID
        self.id = id
    }
}

// MARK: - Core
class Core: Codable {
    let core: String?
    let flight: Int?
    let gridfins, legs, reused: Bool?
    let landingAttempt, landingSuccess, landingType, landpad: JSONNull?

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
        case landpad
    }

    init(core: String?, flight: Int?, gridfins: Bool?, legs: Bool?, reused: Bool?, landingAttempt: JSONNull?, landingSuccess: JSONNull?, landingType: JSONNull?, landpad: JSONNull?) {
        self.core = core
        self.flight = flight
        self.gridfins = gridfins
        self.legs = legs
        self.reused = reused
        self.landingAttempt = landingAttempt
        self.landingSuccess = landingSuccess
        self.landingType = landingType
        self.landpad = landpad
    }
}

// MARK: - Fairings
class Fairings: Codable {
    let reused, recoveryAttempt, recovered: JSONNull?
    let ships: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered, ships
    }

    init(reused: JSONNull?, recoveryAttempt: JSONNull?, recovered: JSONNull?, ships: [JSONAny]) {
        self.reused = reused
        self.recoveryAttempt = recoveryAttempt
        self.recovered = recovered
        self.ships = ships
    }
}

enum Launchpad: String, Codable {
    case the5E9E4501F509094Ba4566F84 = "5e9e4501f509094ba4566f84"
    case the5E9E4502F509092B78566F87 = "5e9e4502f509092b78566f87"
    case the5E9E4502F509094188566F88 = "5e9e4502f509094188566f88"
}

// MARK: - Links
class Links: Codable {
    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
    let presskit: JSONNull?
    let webcast: String?
    let youtubeID: String?
    let article, wikipedia: JSONNull?

    enum CodingKeys: String, CodingKey {
        case patch, reddit, flickr, presskit, webcast
        case youtubeID = "youtube_id"
        case article, wikipedia
    }

    init(patch: Patch, reddit: Reddit, flickr: Flickr, presskit: JSONNull?, webcast: String?, youtubeID: String?, article: JSONNull?, wikipedia: JSONNull?) {
        self.patch = patch
        self.reddit = reddit
        self.flickr = flickr
        self.presskit = presskit
        self.webcast = webcast
        self.youtubeID = youtubeID
        self.article = article
        self.wikipedia = wikipedia
    }
}

// MARK: - Flickr
class Flickr: Codable {
    let small, original: [JSONAny]

    init(small: [JSONAny], original: [JSONAny]) {
        self.small = small
        self.original = original
    }
}

// MARK: - Patch
class Patch: Codable {
    let small, large: String?

    init(small: String?, large: String?) {
        self.small = small
        self.large = large
    }
}

// MARK: - Reddit
class Reddit: Codable {
    let campaign: String?
    let launch, media: JSONNull?
    let recovery: String?

    init(campaign: String?, launch: JSONNull?, media: JSONNull?, recovery: String?) {
        self.campaign = campaign
        self.launch = launch
        self.media = media
        self.recovery = recovery
    }
}

enum Rockett: String, Codable {
    case the5E9D0D95Eda69973A809D1Ec = "5e9d0d95eda69973a809d1ec"
}

typealias Welcomee = [Upcoming]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}





