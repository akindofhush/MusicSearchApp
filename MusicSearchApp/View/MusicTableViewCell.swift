//
//  MusicDataCell.swift
//  MusicSearchApp
//
//  Created by Tzu-Yen Huang on 2021/4/4.
//  Copyright © 2021 Tzu-Yen Huang. All rights reserved.
//

import Foundation
import UIKit

class MusicTableViewCell : UITableViewCell {
    @IBOutlet var trackName: UILabel!
    @IBOutlet var artistName: UILabel!
    @IBOutlet var collectionName: UILabel!
    @IBOutlet var picture: UIImageView!
    @IBOutlet var playPauseButton: PlayPauseButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playPauseButton.setBackgroundImage(UIImage(named:"play"), for: .normal)
    }
}
