//
//  DeezerAlbum.swift
//  TopPop
//
//  Created by Domagoj Biškup on 07/05/2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let albumTracks = try? newJSONDecoder().decode(AlbumTracks.self, from: jsonData)

import Foundation

// MARK: - AlbumTracks
struct AlbumTracks: Codable {
    let data: [Datum]
    let total: Int
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case id, title
    }
}

