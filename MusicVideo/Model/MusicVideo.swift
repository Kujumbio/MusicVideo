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
    private var _vRights:String
    private var _vPrice:String
    private var _vImageUrl:String
    private var _vArtist:String
    private var _vVideoUrl:String
    private var _vMid:String
    private var _vGener:String
    private var _vLinktoiTunes:String
    private var _vReleaseDate:String
    
    
    var vImageData:NSData?
    
    
    var vName: String{
        return _vName
    }
    
    var vRights: String{
        return _vRights
    }
    
    var vPrice: String{
        return _vPrice
    }
    
    var vImageUrl: String{
        return _vImageUrl
    }
    
    var vArtist: String{
        return _vArtist
    }
    
    var vVideoUrl: String{
        return _vVideoUrl
    }
    
    var vMid: String{
        return _vMid
    }
    
    
    var vGener:String{
        return _vGener
    
    }
    var vLinktoiTunes:String{
        return _vLinktoiTunes
    }
    var vReleaseDate:String{
        return _vReleaseDate
    }

    
    
    init (data : JSONDictonary){
        
        
        if let name = data["im:name"] as? JSONDictonary,vName = name["label"] as? String{
            
           _vName = vName
            
        }else{
            _vName = ""
        }
        
        if let right = data["rights"] as? JSONDictonary,rights = right["label"] as? String {
            _vRights = rights
        }else{
            _vRights = ""
        }
        
        if let pric = data["im:price"] as? JSONDictonary,price = pric["label"] as? String {
            _vPrice = price
        }else{
            _vPrice = ""
        }
        
        
        
        if let image = data["im:image"] as? JSONArray,img = image[2] as? JSONDictonary,imagee = img["label"] as? String{
            _vImageUrl = imagee.stringByReplacingOccurrencesOfString("100X100", withString: "600X600")
        }else{
            _vImageUrl = ""
        }
        
        
        if let art = data["im:artist"] as? JSONDictonary,artist = art["label"] as? String {
            _vArtist = artist
        }else{
            _vArtist = ""
        }
        
        
        if let Video = data["link"] as? JSONArray, Vid = Video[1] as? JSONDictonary,vide = Vid["attributes"] as? JSONDictonary,href = vide ["href"] as? String {
            _vVideoUrl = href
            
        }else{
            _vVideoUrl = ""
        }
        
        if let id = data["id"] as? JSONDictonary, mid = id["attributes"] as? JSONDictonary,vMid = mid ["im:id"] as? String {
            _vMid = vMid
            
        }else{
            _vMid = ""
        }
        
        
        if let id = data["category"] as? JSONDictonary, mid = id["attributes"] as? JSONDictonary,vGener = mid ["term"] as? String {
            _vGener = vGener
        }else{
            _vGener = ""
        }
        if let Link = data["id"] as? JSONDictonary, vLinktoiTunes = Link ["id"] as? String{
            _vLinktoiTunes = vLinktoiTunes
        }else{
            _vLinktoiTunes = ""
        }
        
        if let Release = data["im:releaseDate"] as? JSONDictonary,Date = Release["attributes"] as? JSONDictonary,vReleaseDate = Date["label"] as? String {
            _vReleaseDate = vReleaseDate
        }else{
            _vReleaseDate = ""
        }
        


        
    }
    
}
