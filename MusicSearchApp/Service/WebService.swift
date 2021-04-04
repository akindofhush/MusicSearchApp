//
//  WebService.swift
//  MusicSearchApp
//
//  Created by Tzu-Yen Huang on 2021/4/4.
//  Copyright © 2021 Tzu-Yen Huang. All rights reserved.
//

import Foundation
class Webservice {
    
    func getMusicData(url: URL, completion: @escaping ([MusicData]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let musicList = try? JSONDecoder().decode(MusicList.self, from: data)
                
                if let musicList = musicList {
                    completion(musicList.results)
                }
            }
            
        }.resume()
        
    }
    
}
