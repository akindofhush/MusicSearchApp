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
    let wrapperType: String
    let explicitness: String
    let kind: String
    let trackName: String
    let artistName: String
    let collectionName: String
    let censoredName: String
    let artworkUrl60: String?
    let artworkUrl100: String?
    let viewURL: String
    let previewUrl: String?
    let trackTimeMillis: String?
}
