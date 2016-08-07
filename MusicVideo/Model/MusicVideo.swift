//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Sreeram R on 07/08/16.
//  Copyright © 2016 Sreeram R. All rights reserved.
//

import Foundation

class Videos {
    
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    
    
    var vName: String{
        return self.vName
    }
    
    var vImageUrl: String{
        return self.vImageUrl
    }
    
    var vVideoUrl: String{
        return self.vVideoUrl
    }
    
    
    init (data : JSONDictonary){
        
        
        if let name = data["im:name"] as? JSONDictonary,vName = name["label"] as? String{
            
           _vName = vName
            
        }else{
            _vName = ""
        }
        
        if let image = data["im:image"] as? JSONArray,img = image[2] as? JSONDictonary,imagee = img["label"] as? String{
            _vImageUrl = imagee.stringByReplacingOccurrencesOfString("100X100", withString: "600X600")
        }else{
            _vImageUrl = ""
        }
        
        if let Video = data["link"] as? JSONArray, Vid = Video[1] as? JSONDictonary,vide = Vid["attributes"] as? JSONDictonary,href = vide ["href"] as? String {
            _vVideoUrl = href
            
        }else{
            _vVideoUrl = ""
        }
        
    }
    
}
