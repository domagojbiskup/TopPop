//
//  DeezerChart.swift
//  TopPop
//
//  Created by Domagoj Biškup on 07/05/2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let deezerChart = try? newJSONDecoder().decode(DeezerChart.self, from: jsonData)

import Foundation

// MARK: - DeezerChart
struct DeezerChart: Codable {
    let tracks: Tracks
}

// MARK: - Tracks
struct Tracks: Codable {
    let data: [TracksDatum]
    let total: Int
}

// MARK: - TracksDatum
struct TracksDatum: Codable {
    let id: Int
    let title: String
    let duration: Int
    let position: Int
    let artist: ArtistElement
    let album: Album

    enum CodingKeys: String, CodingKey {
        case id, title
        case duration
        case position, artist, album
    }
}

// MARK: Album
struct Album: Codable {
    let id: Int
    let title: String
    let coverMedium: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case coverMedium = "cover_medium"
    }
}

// MARK: - ArtistElement
struct ArtistElement: Codable {
    let id: Int
    let name: String
    let picture: String

    enum CodingKeys: String, CodingKey {
        case id, name, picture
    }
}


