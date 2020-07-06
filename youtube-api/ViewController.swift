//
//  ViewController.swift
//  youtube-api
//
//  Created by Wissam Noureddine on 7/5/20.
//  Copyright © 2020 Wissam Noureddine. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, ModelDelegate{
    
    
    
    
    @IBOutlet var tableView: UITableView!
    var model = Model()
    var videos = [Video]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set itself as the data source and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        
        model.delegate = self
        model.getVideos()
    }
    
    // MARK: Table View Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEO_CELL_ID, for: indexPath)
        
        // Configure the cell with the data
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        
        return cell
        
    }
    
    
    // MARK: Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        tableView.reloadData()
    }

}

