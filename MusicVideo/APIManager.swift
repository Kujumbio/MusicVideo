//
//  APIManager.swift
//  MusicVideo
//
//  Created by Sreeram R on 31/07/16.
//  Copyright © 2016 Sreeram R. All rights reserved.
//

import Foundation


class APIManager {
    
    func loadData(urlstring:String,completion:([Videos]) -> Void){
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        
//        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlstring)!
        
        let task = session.dataTaskWithURL(url){
            (data,response,error) -> Void in
            
            if error != nil{
                print(error!.localizedDescription)
            }
            else{
               
                do{
                    
                     if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictonary,feed = json["feed"] as? JSONDictonary,entries = feed["entry"] as?JSONArray {
                        
                        var video = [Videos]()
                        
                        for entrie in entries {
                            let entry = Videos(data: entrie as! JSONDictonary)
                            video.append(entry)
                        }
                        
                        
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        
                        dispatch_async(dispatch_get_global_queue(priority, 0), { 
                            dispatch_async(dispatch_get_main_queue(), { 
                                completion(video)
                            })
                        })
                    }
                    
                }catch{
                    print("Error in JsonSerialization")
                }
                
                
            
            }
            
            
        }
        task.resume()
}
    
}