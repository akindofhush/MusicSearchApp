//
//  ListViewController.swift
//  MusicSearchApp
//
//  Created by Tzu-Yen Huang on 2021/4/4.
//  Copyright © 2021 Tzu-Yen Huang. All rights reserved.
//

import UIKit
import AVFoundation

class ListViewController: UIViewController {
    
    private var musicListVM: MusicListViewModel!
    @IBOutlet var musicTableView: UITableView!
    @IBOutlet var textField: UITextField!
    var currentSender: PlayPauseButton?
    var currentPreviewUrl: URL?
    var audioPlayer: AVPlayer?
    var playerItem: AVPlayerItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name:
        NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    @objc func videoDidEnd(notification: NSNotification) {
        // when track stop, change to inital stauts
        currentSender?.setBackgroundImage(UIImage(named:"play"), for: .normal)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicListVM == nil ? 0 : self.musicListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath) as? MusicTableViewCell else {
            fatalError("MusicTableViewCell not found")
        }
        // setting data display on cell according to viewModel
        let musicVM = self.musicListVM.musicAtIndex(indexPath.row)
        cell.artistName.text = musicVM.artistName
        cell.collectionName.text = musicVM.collectionName
        cell.trackName.text = musicVM.trackName
        cell.picture.image = musicVM.picture
        cell.playPauseButton.previewUrl = musicVM.previewTrack
        // avoid resusecell error
        if (currentPreviewUrl == musicVM.previewTrack) {
            cell.playPauseButton.setBackgroundImage(UIImage(named:"pause"), for: .normal)
        }
        else {
            cell.playPauseButton.setBackgroundImage(UIImage(named:"play"), for: .normal)
        }
        cell.playPauseButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func buttonAction(sender: PlayPauseButton) {
        // if changed track, set the old track as inital status
        if (sender != currentSender) {
            audioPlayer?.pause()
            currentSender?.setBackgroundImage(UIImage(named:"play"), for: .normal)
            currentSender?.isPlaying = false
        }
        guard let url = sender.previewUrl else { return }
        playerItem = AVPlayerItem(url: url)
        audioPlayer = AVPlayer(playerItem: playerItem)
        if (!sender.isPlaying) {
            audioPlayer!.play()
            sender.setBackgroundImage(UIImage(named:"pause"), for: .normal)
            sender.isPlaying = true
            currentSender = sender
            currentPreviewUrl = sender.previewUrl
        }
        else {
            audioPlayer?.pause()
            sender.setBackgroundImage(UIImage(named:"play"), for: .normal)
            sender.isPlaying = false
        }
    }
}

extension ListViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let requestString = textField.text
        guard let url = URL(string:"https://itunes.apple.com/search?term=\(requestString ?? "")&limit=25") else { return }
        Webservice().getMusicData(url: url) { musicData in
            
            if let musicData = musicData {

                self.musicListVM = MusicListViewModel(musicData: musicData)
                
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

