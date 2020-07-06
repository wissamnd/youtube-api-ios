//
//  VideoTableViewCell.swift
//  youtube-api
//
//  Created by Wissam Noureddine on 7/6/20.
//  Copyright © 2020 Wissam Noureddine. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var video : Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(_ v : Video){
        self.video = v
        
        guard self.video != nil else {return}
        
        // set the title
        self.titleLabel.text = video?.title
        
        // set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // set the thumbnail
        
        guard self.video!.thumbnail != "" else {return}
        
        
        // Check cache
        
        if let cachedData = CacheManager.getVideoCahce(self.video!.thumbnail){
            // Set the thumbnail
            
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)!
        
        
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url , completionHandler: {
            (data, response , error) in
            
            if error == nil && data != nil {
                
                CacheManager.setVideoCache(url.absoluteString, data)
                
                if url.absoluteString != self.video?.thumbnail{
                    return
                }
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        })
        dataTask.resume()
    }

}
