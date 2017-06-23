//
//  Tweet.swift
//  TwitterGuest
//
//  Created by Robert on 6/23/17.
//  Copyright © 2017 NotFound. All rights reserved.
//

import Foundation

class Tweet{
    var id: Int64?
    var idStr: String?
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: Date?
    var favorited: Bool?
    var retweeted: Bool?
    var retweetCount: Int?
    var favoriteCount: Int?
    
    
    
    init(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int64
        idStr = dictionary["id_str"] as? String
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.date(from: createdAtString!)
        
        favorited = dictionary["favorited"] as? Bool
        retweeted = dictionary["retweeted"] as? Bool
        retweetCount = dictionary["retweet_count"] as? Int
        favoriteCount = dictionary["favorite_count"] as? Int
    }
    
    
    
    
    
    
    
    
    
}
