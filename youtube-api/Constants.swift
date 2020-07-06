//
//  constants.swift
//  youtube-api
//
//  Created by Wissam Noureddine on 7/5/20.
//  Copyright © 2020 Wissam Noureddine. All rights reserved.
//

import Foundation

struct Constants{
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
