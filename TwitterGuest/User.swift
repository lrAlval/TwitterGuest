//
//  User.swift
//  TwitterGuest
//
//  Created by Robert on 6/18/17.
//  Copyright © 2017 NotFound. All rights reserved.
//

import Foundation


var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"


class User {
    var name: String?
    var screenName: String?
    var profileImageUrl: String?
    var tagline: String?
    var dictionary: NSDictionary
    
    var biggerProfileImageUrl: String? {
        get {
            return profileImageUrl?.replacingOccurrences(of: "_normal", with: "_bigger")
        }
    }
    
    var atScreenName: String? { get { return "@\(screenName!)" } }
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profile_image_url_https"] as? String
        tagline = dictionary["description"] as? String
    }
    
    func logout() {
        // Clear the current user global
        User.currentUser = nil
        
        // Clear user access token on TwitterClient
        TwitterClient.sharedInstance.removeAccessToken()
        
        //.requestSerializer.removeAccessToken()
        
        // Fire notification to any other view controller listening
        NotificationCenter.default.post(name: Notification.Name(rawValue: userDidLogoutNotification), object: nil)
    }
    
    
    class var currentUser: User? {
        
        get {
            if _currentUser == nil {
                let data = UserDefaults.standard.object(forKey: currentUserKey) as? Data
                if data != nil {
                    print("data ->\(data!)")
                    let dictionary = try? JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    
                    if let dict = dictionary {
                        _currentUser = User(dictionary: dict!)
                    }
                }
            }
            return _currentUser
        }
        
        set(user) {
            _currentUser = user
            
            if _currentUser != nil {
                let data = try! JSONSerialization.data(withJSONObject: user!.dictionary, options: [])
                UserDefaults.standard.set(data, forKey: currentUserKey)
            } else {
                UserDefaults.standard.set(nil, forKey: currentUserKey)
            }
            UserDefaults.standard.synchronize()
        }
    }

    
    
    
}

