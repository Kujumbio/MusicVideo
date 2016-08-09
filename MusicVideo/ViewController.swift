//
//  ViewController.swift
//  MusicVideo
//
//  Created by Sreeram R on 31/07/16.
//  Copyright © 2016 Sreeram R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = APIManager()
        api.loadData("https://itunes.apple.com/in/rss/topmusicvideos/limit=10/json", completion: didloadData)
    }

    func didloadData(videos: [Videos] ){
        print(reachabilitystatus)
        
        for item in videos {
            print("\(item.vName)")
        }
        
    
        
//        let alert = UIAlertController(title: "Result", message: result, preferredStyle: .Alert)
//        
//        let OkButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
//        
//        alert.addAction(OkButton)
//        
//        self.presentViewController(alert, animated: true, completion: nil)
//        print(result)
    }


}

