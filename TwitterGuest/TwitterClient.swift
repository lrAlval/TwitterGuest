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
import OAuthSwiftAlamofire
import Alamofire


//typealias SuccessHandler = (_ response: [:],					)

//typealias onDone = (Dictionary<String, AnyObject>) -> Void
typealias onDone = (Any?) -> Void
typealias onFail = (Error!) -> Void

class TwitterClient {
    
    static let sharedInstance = TwitterClient()
    
    var auth: OAuth1Swift?
    var authTokens: OAuthSwiftCredential?
    //    private var afManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
    private var afManager = Alamofire.SessionManager.default
    
    //     typealias CompletionBlock = (Bool, Dictionary<String,AnyObject>) -> Void
    
    func onOAuthTwitter() {
        
        auth = OAuth1Swift(
            consumerKey: URIs.ConsumerKey,
            consumerSecret: URIs.ConsumerSecret,
            requestTokenUrl: URIs.RequestTokenUrl,
            authorizeUrl: URIs.authorizeURL,
            accessTokenUrl: URIs.AccessTokenUrl
        )
        
        let _ = auth!.authorize( withCallbackURL: URL(string: URIs.CallBackUrl)!, success: { credential, response, parameters in
            
            self.afManager.adapter = self.auth!.requestAdapter
        
            
            //testing signed request
            self.get(URIs.HomeTimelineUrl, ["count": "20"], { res in
                print(res ?? "no hay valor , fue la life  :(")
            },{ fail in
                print(fail)
            })
            
            
            
        }, failure: { error in
            print("error :( \(error.description)")
            print(error.localizedDescription)
        })
    }
    
    
    
    
    

    func get(_ url: String!, _ args: [String: Any]?, _ sucess: @escaping onDone, _ fail: @escaping onFail) {
        afManager.request(url!, method: .get, parameters: args, encoding: URLEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let val):
                    sucess(val)
                case .failure(let err):
                    fail(err)
                }
        }
        
    }
    
    
    func post(_ url: String!, _ args: [String: Any]?, _ sucess: @escaping onDone, _ fail: @escaping onFail) {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        afManager.request(url!, method: .post, parameters: args, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let val):
                    sucess(val)
                case .failure(let err):
                    fail(err)
                }
        }
        
    }
    
    
    
    
    
    class func isConnectedToNetwork() -> Bool {
        let reachability: Reachability = Reachability.init()!
        
        if(reachability.currentReachabilityStatus == .notReachable) {
            return false
        } else {
            return true
        }
    }
    
    func saveAccessToken(_ credentials: OAuthSwiftCredential) {
        self.authTokens = credentials
    }
    
    func removeAccessToken() {
        self.authTokens = nil
    }
    
    
    
    
    
    //    typealias CompletionBlock = (Bool, Dictionary<String, AnyObject>) -> Void
    //
    //
    //    func callUrlWithCompletion(url: String!, params: [String: AnyObject]!, completion: @escaping CompletionBlock, method: HTTPMethod) {
    //
    //        let urlString = url
    //
    //        let headers: HTTPHeaders = [
    //            "Content-Type": "application/json",
    //            "TokenHeader": ""
    //        ]
    //
    //        Alamofire.request(urlString!, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
    //
    //            if(response.response?.statusCode == 200) {
    //                completion(true, response.result.value as! Dictionary)
    //            } else {
    //                completion(false, Dictionary<String, AnyObject>())
    //            }
    //        }
    //    }
    
    //    NetworkManager.sharedInstance.callUrlWithCompletion(url: url, params: nil, completion: { (finished, response) in
    //
    //    if(finished){
    //
    //    //print(response)
    //
    //    let result = NSMutableArray(array: response["results"] as! NSArray)
    //
    //    self.songsData = result
    //
    //    print(self.songsData)
    //
    //
    //    self.songsCollection.reloadData()
    //
    //    }else{
    //
    //    /// error de conexion
    //    }
    //
    //    }, method: .get)
    //
    //
    
    
    
}
