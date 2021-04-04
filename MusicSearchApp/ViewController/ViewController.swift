//
//  ViewController.swift
//  MusicSearchApp
//
//  Created by Tzu-Yen Huang on 2021/4/4.
//  Copyright © 2021 Tzu-Yen Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    private var musicListVM: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string:"https://itunes.apple.com/search?term=jack+johnson&limit=25") else { return }
        Webservice().getMusicData(url: url) { musicData in
            
//            if let musicData = musicData {
//
//                self.articleListVM = ArticleListViewModel(articles: articles)
//                
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
        }
    }


}

