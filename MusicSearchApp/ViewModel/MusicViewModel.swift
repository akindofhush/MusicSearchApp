//
//  MusicViewModel.swift
//  MusicSearchApp
//
//  Created by Tzu-Yen Huang on 2021/4/4.
//  Copyright © 2021 Tzu-Yen Huang. All rights reserved.
//

import Foundation
import UIKit

struct MusicListViewModel {
    let musicData: [MusicData]
}

extension MusicListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.musicData.count
    }
    
    func musicAtIndex(_ index: Int) -> MusicViewModel {
        let music = self.musicData[index]
        return MusicViewModel(music)
    }
    
}

struct MusicViewModel {
    private let music: MusicData
}

extension MusicViewModel {
    init(_ music: MusicData) {
        self.music = music
    }
}

extension MusicViewModel {
    
    var picture: UIImage? {
        return try? UIImage(withContentsOfUrl: URL(string: self.music.artworkUrl100 ?? "")!)
    }
    
    var collectionName: String? {
        return self.music.collectionName
    }
    
    var trackName: String? {
        return self.music.trackName
    }
    
    var artistName: String? {
        return self.music.artistName
    }
    
    var previewTrack: URL? {
        return URL(string: self.music.previewURL ?? "")
    }
}

extension UIImage {

    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
    
        self.init(data: imageData)
    }

}
