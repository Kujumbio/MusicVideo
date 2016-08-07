//
//  APIManager.swift
//  MusicVideo
//
//  Created by Sreeram R on 31/07/16.
//  Copyright © 2016 Sreeram R. All rights reserved.
//

import Foundation


class APIManager {
    
    func loadData(urlstring:String,completion:(result:String) -> Void){
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        
//        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlstring)!
        
        let task = session.dataTaskWithURL(url){
            (data,response,error) -> Void in
            
            dispatch_async(dispatch_get_main_queue()){
                if error != nil{
                    completion(result: error!.localizedDescription)
                }else{
                    completion(result: "NSURLSession Successful")
                    print(data)
                
                }
            }
        
            
        }
        task.resume()
}
    
}