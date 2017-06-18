//
//  ConfigurationUtilities.swift
//  TwitterGuest
//
//  Created by Robert on 6/17/17.
//  Copyright © 2017 NotFound. All rights reserved.
//

import Foundation

enum URIs {
    static let twBaseUrl = NSURL(string: "https://api.twitter.com")
    static let ConsumerKey = ConfigurationUtilites.GetAppSettings(key: "ConsumerKey")
    static let ConsumerSecret = ConfigurationUtilites.GetAppSettings(key: "ConsumerSecret")
    
    //authentication EndPoints
    static let authorizeURL = ConfigurationUtilites.GetAppSettings(key: "authorizeURL")
    static let RequestTokenUrl = ConfigurationUtilites.GetAppSettings(key: "RequestTokenUrl")
    static let AccessTokenUrl = ConfigurationUtilites.GetAppSettings(key: "AccessTokenUrl")
    static let AuthenticateUrl = ConfigurationUtilites.GetAppSettings(key: "AuthenticateUrl")
    static let VerifyCredentialsUrl = ConfigurationUtilites.GetAppSettings(key: "VerifyCredentialsUrl")
    
    //Critical EndPoints
    static let HomeTimelineUrl = ConfigurationUtilites.GetAppSettings(key: "HomeTimelineUrl")
    static let TweetUrl = ConfigurationUtilites.GetAppSettings(key: "TweetUrl")
    static let CreateFavoriteUrl = ConfigurationUtilites.GetAppSettings(key: "CreateFavoriteUrl")
    static let DestroyFavoriteUrl = ConfigurationUtilites.GetAppSettings(key: "DestroyFavoriteUrl")
    static let RetweetUrl = ConfigurationUtilites.GetAppSettings(key: "RetweetUrl")
    static let CallBackUrl = ConfigurationUtilites.GetAppSettings(key: "CallBackUrl")
}









class ConfigurationUtilites {
    static let shared = ConfigurationUtilites()
    class func GetAppSettings(key: String) -> String {
        var val = ""
        if let path = Bundle.main.path(forResource: "Uris", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            val = dict[key] as! String
        }
        return val
    }
}
