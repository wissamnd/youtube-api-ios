//
//  ViewController.swift
//  youtube-api
//
//  Created by Wissam Noureddine on 7/5/20.
//  Copyright © 2020 Wissam Noureddine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

