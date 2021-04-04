//
//  MusicData.swift
//  MusicSearchApp
//
//  Created by Tzu-Yen Huang on 2021/4/4.
//  Copyright © 2021 Tzu-Yen Huang. All rights reserved.
//

import Foundation

struct MusicList : Decodable {
    let resultCount: Int
    let results : [MusicData]
}

struct MusicData : Decodable {
    let artistID, collectionID, trackID, discCount, discNumber, trackCount, trackNumber, trackTimeMillis: Int?
    let wrapperType, kind, artistName, collectionName, trackName, collectionCensoredName, trackCensoredName, artistViewURL, collectionViewURL, trackViewURL, previewURL, artworkUrl30, artworkUrl60, artworkUrl100, releaseDate, collectionExplicitness, trackExplicitness, country, currency, primaryGenreName: String?
    let collectionPrice, trackPrice: Double?
    let isStreamable: Bool?
    
    enum CodingKeys: String, CodingKey {
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case wrapperType, kind, artistName, collectionName, trackName, collectionCensoredName, trackCensoredName, artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable
    }
}
