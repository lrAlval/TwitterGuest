//
//  NewTweetVC.swift
//  TwitterGuest
//
//  Created by Robert Alva on 6/1/17.
//  Copyright © 2017 NotFound. All rights reserved.
//

import UIKit

class NewTweetVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func CloseNewTweet(){
        self.dismiss(animated: true, completion: nil)
    }

}
