//
//  TwitterClient.swift
//  TwitterGuest
//
//  Created by Robert on 6/17/17.
//  Copyright © 2017 NotFound. All rights reserved.
//

import Foundation
import ReachabilitySwift
import OAuthSwift

class TwitterClient {
    
    static let sharedInstance = TwitterClient()
    
    var auth: OAuth1Swift?
    
    func onOAuthTwitter() {
        
        auth = OAuth1Swift(
            consumerKey: URIs.ConsumerKey,
            consumerSecret: URIs.ConsumerSecret,
            requestTokenUrl: URIs.RequestTokenUrl,
            authorizeUrl: URIs.authorizeURL,
            accessTokenUrl: URIs.AccessTokenUrl
        )
        
        let _ =  auth!.authorize( withCallbackURL: URL(string: URIs.CallBackUrl)!, success: { credential, response, parameters in
            
            print("auth token  : \(credential.oauthToken)")
            print("secret token : \(credential.oauthTokenSecret)")
            print("userid ?? : \(parameters["user_id"] ?? "sin userid :( ")")
            
            //TODO ADD A USER CLASS , PERSIST THE TOKENS AND PROCEED WITH INIFINTE SCROLLING ON TIMELINE
        }, failure: { error in
            print("error :( \(error.description)")
            print(error.localizedDescription)
        })
    }
    
    
    
    
    class func isConnectedToNetwork() -> Bool {
        let reachability: Reachability = Reachability.init()!
        
        if(reachability.currentReachabilityStatus == .notReachable){
            return false
        }else{
            return true
        }
    }
    
}
