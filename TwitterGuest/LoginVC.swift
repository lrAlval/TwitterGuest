//
//  LoginVC.swift
//  TwitterGuest
//
//  Created by Robert Alva on 5/31/17.
//  Copyright © 2017 NotFound. All rights reserved.
//

import Iconic
import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TODO redirect after this
    @IBAction func onLogin(){
        TwitterClient.sharedInstance.onOAuthTwitter()
    }
    
}
