//
//  FlickrAPI.swift
//  Photorama
//
//  Created by santhosh damodharan on 2018-03-12.
//  Copyright © 2018 santhosh damodharan. All rights reserved.
//

import Foundation

enum Method: String {
    case interestingPhotos = "flicker.interestingness.getList"
}

struct FlickrAPI {
    
   private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "49ac4ec879c3bfc2cca2e3ad151ef699"
    private static func flickrURL(Method: Method,parameters: [String:String]?) -> URL {
        
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method" : Method.rawValue,
            "format" : "json",
            "nojsoncallback" : "1",
            "api_key" : apiKey
        ]
        
        for(key , value) in baseParams{
            
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        
        if let additionalParams = parameters{
            
            for (key,value) in additionalParams{
                let item = URLQueryItem(name: key , value:value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!

        return URL(string: "")!
        
    }
    static var interestingPhotosURL: URL {
        
        return flickrURL(Method: .interestingPhotos, parameters: ["extras" : "url_h,date_taken"])
    }
    
}

