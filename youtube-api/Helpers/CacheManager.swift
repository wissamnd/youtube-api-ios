//
//  CacheManager.swift
//  youtube-api
//
//  Created by Wissam Noureddine on 7/6/20.
//  Copyright © 2020 Wissam Noureddine. All rights reserved.
//

import Foundation


class CacheManager{
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url :String , _ data : Data?){
        
        // Store the image data from the url as the key
        cache[url] = data
    }
    
    static func getVideoCahce(_ url : String) -> Data?{
        return cache[url]
    }
}
