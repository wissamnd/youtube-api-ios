//
//  Model.swift
//  youtube-api
//
//  Created by Wissam Noureddine on 7/5/20.
//  Copyright © 2020 Wissam Noureddine. All rights reserved.
//

import Foundation


protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}

class Model{
    
    var delegate: ModelDelegate?
    
    func getVideos(){
        
        // Create a URL object
        
        let url  = URL(string: Constants.API_URL)!
        
        // Get the  URL.session
        let session =  URLSession.shared
        
        // Get a data task
        
        let dataTask = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil || data == nil {
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                if let items = response.items {
                    
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(items)
                    }
                    
                }
                
            }
            
            catch {
                
            }
            
            
        })
        
        // kikof the task
        dataTask.resume()
    }
}
